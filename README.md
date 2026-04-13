## About

This repository serves as a centralized resource for Linux users, providing setup guides, installation scripts, system configuration helpers, and troubleshooting utilities.

It covers common tasks such as IDE installation, development environment provisioning, system tuning, incident response, and performance optimization across multiple Linux distributions.

The content is organized by purpose and workflow to make it easier to find the right scripts for every stage of setup, maintenance, and recovery.

## Table of Contents

- [Folder Overview](#folder-overview)
  - [AUTO](#auto)
  - [INCIDENT-OPS](#incident-ops)
  - [OPS-KIT](#ops-kit)
  - [PERF-OPS](#perf-ops)
  - [PERFORMANCE](#performance)
  - [SETUP](#setup)
  - [SYSCTL-LITE](#sysctl-lite)
  - [TOOLS](#tools)
- [Getting Started](#getting-started)
- [Usage Examples](#usage-examples)
- [License](#license)

## Folder Overview

### AUTO
Automation helpers and recurring workflow scripts.
- `AUTO/auto.sh`: generic automation entrypoint
- `AUTO/config.sh`, `AUTO/dev.sh`, `AUTO/setup.sh`, `AUTO/system.sh`, `AUTO/utils.sh`
- Best for repeatable automation tasks and system helper scripts.

### INCIDENT-OPS
Incident response and troubleshooting utilities.
- `INCIDENT-OPS/incident.sh`, `INCIDENT-OPS/files.sh`, `INCIDENT-OPS/processes.sh`, `INCIDENT-OPS/users.sh`
- Use this when you need to inspect or recover a system after a failure, misconfiguration, or security issue.

### OPS-KIT
General operations tooling for day-to-day Linux maintenance.
- `OPS-KIT/ops.sh`, `OPS-KIT/logs.sh`, `OPS-KIT/rotate.sh`, `OPS-KIT/services.sh`
- Focuses on log rotation, service checks, and operational workflow, not one-time provisioning.

### PERF-OPS
Performance-focused operational checks and snapshot utilities.
- `PERF-OPS/perf.sh`, `PERF-OPS/battery.sh`, `PERF-OPS/cpu.sh`, `PERF-OPS/disk.sh`, `PERF-OPS/memory.sh`, `PERF-OPS/snapshot.sh`
- Use this for performance diagnostics and monitoring rather than hardware-specific tuning.

### PERFORMANCE
Hardware-specific performance mode scripts.
- `PERFORMANCE/elitebook-performance.sh`, `PERFORMANCE/elitebook-disable-performance.sh`
- Intended for toggling platform tuning modes on supported systems.

### SETUP
Installation and environment provisioning scripts.
- `SETUP/Desktop/setup.sh`, `SETUP/Server/server-setup.sh`
- Includes more formal setup flows for desktop and server environments.

### SYSCTL-LITE
Lightweight sysctl configuration and tuning helpers.
- `SYSCTL-LITE/sysctl.sh`, `SYSCTL-LITE/status.sh`, `SYSCTL-LITE/network.sh`, `SYSCTL-LITE/update.sh`, `SYSCTL-LITE/cleanup.sh`, `SYSCTL-LITE/backup.sh`
- Use this when you want minimal sysctl management rather than full system provisioning.

### TOOLS
General-purpose Linux helper scripts and cheatsheets.
- `TOOLS/linux.sh`, `TOOLS/modules/explain.sh`, `TOOLS/modules/cheatsheet.sh`
- Best for learning, inspecting the system, and running utility shortcuts.

## Getting Started

1. Open a terminal on your Linux machine.
2. Change to this repository folder:

```bash
cd /path/to/LINUX
```

3. If a script is executable, run it directly; otherwise use `bash`:

```bash
bash SETUP/Desktop/setup.sh
```

4. Explore the folder that matches your current need:
- Provision a new environment with `SETUP/`
- Manage operations with `OPS-KIT/`
- Diagnose incidents with `INCIDENT-OPS/`
- Tune performance with `SYSCTL-LITE/` or `PERFORMANCE/`

## Usage Examples

Run a desktop setup script:

```bash
bash SETUP/Desktop/setup.sh
```

Inspect system processes during a troubleshooting session:

```bash
bash INCIDENT-OPS/processes.sh
```

Check performance metrics with perf utilities:

```bash
bash PERF-OPS/cpu.sh
```

Apply lightweight sysctl tuning:

```bash
bash SYSCTL-LITE/sysctl.sh
```

Open the main ops toolkit:

```bash
bash OPS-KIT/ops.sh
```

## Notes on Folder Naming

- `AUTO` is for automation and recurring workflows.
- `SETUP` is for one-time provisioning and installation flows.
- `OPS-KIT` is for daily operations; `INCIDENT-OPS` is for recovery and incident handling.
- `PERF-OPS` is for performance diagnostics; `PERFORMANCE` is for hardware-specific performance modes.

## License

This repository is licensed under the MIT License. See `LICENSE` for details.
