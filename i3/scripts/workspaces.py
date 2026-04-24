#!/usr/bin/env python3
"""
Very small i3bar workspace_command using i3ipc.
Usage: workspace_command /path/to/workspaces.py [OUTPUT_NAME]
Prints one compact JSON array per update and nothing else to stdout.
"""

import json
import sys

OUT = sys.argv[1] if len(sys.argv) > 1 else ""

try:
    import i3ipc
except Exception:
    # i3ipc not available -> emit a valid empty array and exit
    print("[]")
    sys.exit(0)

conn = i3ipc.Connection()


def current():
    try:
        ws_list = conn.get_workspaces()
    except Exception:
        return []
    out = []
    for w in ws_list:
        if OUT and getattr(w, "output", "") != OUT:
            continue
        item = {
            "name": w.name,
            "visible": bool(w.visible),
            "focused": bool(w.focused),
            "urgent": bool(getattr(w, "urgent", False)),
        }
        o = getattr(w, "output", None)
        if o:
            item["output"] = o
        out.append(item)
    return out


def emit():
    sys.stdout.write(json.dumps(current(), separators=(",", ":")) + "\n")
    sys.stdout.flush()


# initial print
emit()


# re-print on workspace or output events
def _ev(conn_, event):
    emit()


conn.on("workspace", _ev)
conn.on("output", _ev)

conn.main()
