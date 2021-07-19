Development Environment
=======================

Provides a developer friendly environment using `kherge/ubuntu-server:21.04` as the base image.

Usage
-----

```dockerfile
FROM kherge/dev:<VERSION>
```

The `VERSION` may be `latest` or any of the Git tags available.

Features
--------

- Based on Ubuntu Server 21.04 LTS.
    - Containers run until manually stopped.
- Uses non-root user for regular access.
    - Includes `sudo` access.
    - Bundles [`sh.env`](https://github.com/kherge/sh.env) for easier environment setup.
