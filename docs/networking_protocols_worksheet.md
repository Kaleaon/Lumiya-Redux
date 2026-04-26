# Networking Protocols Worksheet (Repo + `secondlife2026.3.1089.apk`)

## Scope and method

This worksheet covers two targets:

1. **The decompiled networking stack in this repo** (`recovered/src/...`), with packet/ACK/UDP/HTTP internals.
2. **`secondlife2026.3.1089.apk`**, downloaded and decompiled in this session (`/tmp/secondlife_apk_jadx`).

For the APK, there is a major constraint: the base APK declares `requiredSplitTypes="base__abi"`, and it contains **no `lib/*.so`** files. That means critical runtime code (especially Unity IL2CPP/native networking implementation) is in ABI split APK(s) not included in the provided URL, so full protocol reconstruction is partial.

---

## Part A — How this repo handles packets, packet data, ACKs, UDP, and HTTP

## 1) Transport architecture: event loop + per-simulator UDP circuits

- `SLConnection` owns a Java NIO `Selector` and runs one worker thread (`SLConnection`), multiplexing many circuits with nonblocking I/O and a timer facility. It repeatedly:
  - asks each circuit for wakeup/idle work,
  - processes readable/writable keys,
  - applies per-circuit idle intervals to select timeout.  
- `SLCircuit` is the core per-simulator transport instance. It creates a nonblocking `DatagramChannel`, connects it to the simulator socket (`simAddress:simPort` from login), and registers it with the selector.  
- `SLGridConnection.startCircuit()` wires login output into transport: obtains caps, creates `SLAgentCircuit` (subclass of `SLCircuit`), starts CAPS EventQueue, registers circuit with `SLConnection`, and sends `UseCircuitCode` to bind session/circuit identity.  

**Implication:** packet flow is not “one blocking socket thread per connection”; it is selector-driven UDP circuits with queued messages and explicit reliability on top of UDP.

## 2) Packet format and serialization (`SLMessage`)

`SLMessage` defines the common wire framing and flags:

- Header starts with bit flags + sequence number + extra-header-length byte.
- Important flags:
  - `LL_RELIABLE_FLAG` (`0x40`): packet requires ACK semantics.
  - `LL_RESENT_FLAG` (`0x20`): retransmitted packet marker.
  - `LL_ACK_FLAG` (`0x10`): packet carries trailing ACK IDs.
  - `LL_ZERO_CODE_FLAG` (`0x80`): payload is zero-coded (compression-like run encoding).
- Message IDs are variable-width decoded (`DecodeMessageID` / `DecodeMessageIDGeneric`).
- Payload serialization is little-endian, while outer framing is big-endian; this is handled by `PackPayloadLE`/`UnpackPayloadLE`.
- ACK lists are piggybacked by appending `int` seq IDs near tail (`AppendPendingAcks`) and then setting `LL_ACK_FLAG` plus count byte.
- On inbound parse (`Unpack`): strip ACK trailer first, optionally zero-decode payload, instantiate message via `SLMessageFactory`, then `UnpackPayload`.

**Key design point:** ACKs are both standalone (`PacketAck` message) and opportunistically piggybacked onto any outgoing packet.

## 3) Reliability and ACK behavior over UDP (`SLCircuit`)

### 3.1 Outgoing path

- `SendMessage()` assigns monotonically increasing `seqNum` (`AtomicInteger`) and enqueues to `outgoingQueue`.
- `ProcessTransmit()`:
  1. takes queue head,
  2. packs it,
  3. appends pending ACKs if space permits,
  4. writes datagram,
  5. if reliable, moves it to `unackedQueue`.
- If no normal message exists but ACKs are pending, it emits a standalone `PacketAck` packet with as many IDs as fit under payload budget.

### 3.2 Incoming ACK handling

- `HandlePacketAck(PacketAck)` iterates ACK IDs and calls `ProcessReceivedAck(seq)`.
- `ProcessReceivedAck()` scans both `unackedQueue` and `outgoingQueue`, removes matching message, and invokes `handleMessageAcknowledged()` callback.

### 3.3 Retransmit and timeout

- `ProcessResends()` checks `unackedQueue` for aged packets (`sentTimeMillis + 5000ms`).
- Retries increment; packets are resent up to 3 retries, after which timeout callback fires (`handleMessageTimeout()`).
- Resends are marked `isResent = true` so receiver can detect duplicate/retry semantics.

### 3.4 Link liveness

- Idle watchdog sends `StartPingCheck` if no packet seen recently.
- After 3 unanswered pings, `ProcessTimeout()` is triggered (connection-specific override logic handles disconnect/reconnect).
- Incoming `StartPingCheck` receives immediate `CompletePingCheck` response.

## 4) Packet data reassembly patterns (higher-level protocol modules)

Beyond base reliable delivery, multiple modules implement **application-level packet sequencing/reassembly**:

### 4.1 Texture UDP transfer (`TextureUDPTransfer`)

- Starts with reliable `RequestImage`.
- Accepts `ImageData` header (size + packet count), then `ImagePacket` chunks.
- Maintains `nextExpectedPacket`, stores out-of-order chunks in map, drains in-order contiguous region, writes to output file stream.
- Declares stall if no packet for 15s; supports retrying request (max 2 retries).

### 4.2 Xfer pipeline (`SLXfer`)

- Initiates via reliable `RequestXfer`.
- Receives `SendXferPacket`; packet 0 contains expected total length in first 4 bytes.
- Copies data into preallocated byte array, tracks `expectedPacketNum`, marks complete when high bit in packet number denotes terminal packet.
- Sends reliable `ConfirmXferPacket` ACK for packets up to currently accepted sequence.

### 4.3 Asset transfer service (`SLTransfer`)

- Uses `TransferRequest` (reliable) and receives `TransferInfo` + `TransferPacket` streams.
- Stores packets by packet index (`ConcurrentHashMap`), then consumes in-order (`nextPacket`) into contiguous output buffer.
- Completion is gated by both status info and contiguous packet availability.

**Why this matters:** there are two reliability layers: base packet ACK/retry in `SLCircuit`, and protocol-specific chunk ordering/completion in each data subsystem.

## 5) HTTP/CAPS and EventQueue channel

The stack is hybrid: real-time state mostly over UDP message circuit, service/API/state updates over HTTP LLSD “caps”.

### 5.1 Caps bootstrap and EventQueue

- `SLGridConnection.startCircuit()` calls `SLCaps.GetCapabilites(loginURL, seedCapability)` and builds a capability URL map.
- Starts `SLCapEventQueue` using `EventQueueGet` capability URL.
- `SLCapEventQueue` runs its own polling thread; posts LLSD XML with:
  - `ack`: last event ID received,
  - `done`: graceful completion marker.
- Parses returned events list and pushes each to `ICapsEventHandler`.

### 5.2 HTTP client behavior (`SLHTTPSConnection` + `LLSDXMLRequest`)

- Uses shared OkHttp client with custom DNS and permissive TLS behavior.
- DNS policy:
  - normal system lookup first,
  - fallback DNS-over-HTTPS resolver via `https://dns.google.com/resolve`,
  - static fallback for key host(s) like `login.agni.lindenlab.com`.
- LLSD requests are synchronous call/response with `application/llsd+xml` payload and LLSD content negotiation.
- `LLSDXMLRequest` stores active `Call` ref to allow interrupt/cancel on shutdown/teleport.

### 5.3 Security posture note

`SLHTTPSConnection` uses a trust-all manager + permissive hostname verifier (`verify(...) -> true`), which trades certificate strictness for connectivity robustness.

## 6) Circuit lifecycle across login/teleport/reconnect

- Login success yields sim address + circuit credentials -> creates `SLCircuitInfo`.
- Sends `UseCircuitCode` reliably on each new circuit (agent temp and main).
- Teleports swap circuits: old circuit closed, EventQueue stopped, new circuit/caps queue started with teleport auth reply.
- Reconnect logic in `SLGridConnection` can automatically relogin and rebuild transport objects.

---

## Part B — `secondlife2026.3.1089.apk`: decompile + protocol findings

## 7) What was actually decompiled

- Downloaded: `https://tmpfiles.org/dl/35205887/secondlife2026.3.1089.apk`.
- Decompiled with `jadx` into `/tmp/secondlife_apk_jadx`.
- Manifest and Java/Kotlin wrappers were recovered.

## 8) Critical limitation: missing ABI split

The base APK manifest includes split requirement (`requiredSplitTypes="base__abi"`), and the archive has no `lib/*` entries. Therefore:

- no `libil2cpp.so` / native transport implementation present in this artifact,
- complete protocol logic cannot be fully reconstructed from Java alone,
- core runtime networking is likely in missing ABI split package(s).

## 9) Still-observable networking evidence in the APK

Even with missing native split, extracted metadata and managed symbols indicate a modern multi-transport stack:

### 9.1 Manifest-level network surface

- Internet + network-state permissions, Unity activity, deep links (`secondlife://`, `http(s)://maps.secondlife.com`), and third-party SDK networking components (FCM/OneSignal/Appsflyer/Billing).
- `usesCleartextTraffic="true"` is enabled.

### 9.2 Metadata/symbol indicators (from `global-metadata.dat` strings)

Observed symbol/string indicators include:

- **gRPC stack**: `grpcChannel`, `grpcCall`, gRPC status diagnostics strings.
- **WebSocket stack**: `RuntimeWebSocketClient`, `DriverWebSocketClient`, `ClientWebSocket`, `altwebsocket-sharp.dll`.
- **UDP extension path**: `FakeUDPExtension`, `IUDPExtensions`, `UDPBindings`, `UDPImpl`, plus explicit user-facing errors about failing to load inventory from UDP package.
- **Event queue concepts**: `EventQueueClient`, `ProcessEventQueue`, `DispatchEventQueueEvents`.
- **Voice transport telemetry**: packet loss/bytes/bitrate diagnostics and voice state fields.

**Inference:** compared to the older Java-centric repo, this APK appears to centralize core networking in Unity/IL2CPP + managed layers with gRPC/WebSocket/UDP extension components and event-queue style dispatching.

## 10) Practical reverse-engineering next step for full protocol detail

To complete protocol-level decompilation (packet framing, ACK semantics, UDP codecs) for this APK version, you need the matching ABI split APK(s), especially the one containing `libil2cpp.so` (likely arm64-v8a split). With that, IL2CPP metadata + binary analysis can map transport classes and packet codecs end-to-end.

---

## Comparison summary: repo stack vs 2026 APK signals

- **Repo (`recovered/src`)**: explicit Java LLUDP stack with custom packet framing, sequence ACK/retry, zero-coding, and LLSD caps polling over HTTP.
- **2026 APK (base only)**: Java layer is mostly shell/integration; strings suggest transport abstraction with gRPC + WebSocket + optional UDP extensions + event queue style message handling, but definitive packet codec logic sits in missing native split.

