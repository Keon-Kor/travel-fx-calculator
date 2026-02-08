@echo off
setlocal
cd /d "%~dp0"
REM Use IPv4 loopback to avoid localhost resolving to ::1 (IPv6) on Windows.
REM Use http2 + IPv4 edge to avoid QUIC/UDP blocks on some networks.
cloudflared.exe tunnel --protocol http2 --edge-ip-version 4 --url http://127.0.0.1:5000 --no-autoupdate > cloudflared.log 2>&1
