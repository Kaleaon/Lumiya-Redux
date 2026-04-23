#!/usr/bin/env bash
set -euo pipefail

python3 tools/protocol/verify_message_template_conformance.py
python3 tools/protocol/verify_protocol_docs.py
python3 tools/protocol/verify_llsd_conformance.py
python3 tools/protocol/verify_model_mapping_conformance.py
