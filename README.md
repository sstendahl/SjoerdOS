
<img src="https://github.com/sstendahl/SjoerdOS/raw/main/files/system/usr/share/pixmaps/fedora_logo.svg" width="300">

# SjoerdOS &nbsp; [![bluebuild build badge](https://github.com/sstendahl/sjoerdos/actions/workflows/build.yml/badge.svg)](https://github.com/sstendahl/sjoerdos/actions/workflows/build.yml)

This is my personal spin of the Universal Blue `silverblue-nvidia` image.

Note that this essentially just a way to save time setting up real and virtual machines, nothing more fancy than that. It's essentially just the default upstream image, but with the apps and settings that I typically install on first-setup. Basically just like any other "distro" that claims to be unique. 

Essentially it's still Fedora Silverblue at its core.
As the intended target audience of this image is me specifically, it's hyper-targeted to me personally and does not represent what I think a good distro would look like. This image may includes applications that are only relevant to a very limited target audience of n = 1.


## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/sstendahl/sjoerdos:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/sstendahl/sjoerdos:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/sstendahl/sjoerdos
```
