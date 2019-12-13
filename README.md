# oc-cc-kernel
\*nix-inspired OS for ComputerCraft. Better sandboxing than OC-OS 2. (Meaning, the global table `_G` is actually sandboxed.)

Requires [OC-EFI](https://github.com/ocawesome101/ocbios/blob/master/uefi.lua) as `startup` in order to boot. Boot files, as well as the kernel ~~image~~ script, are found in `/boot/oc-cc-kernel`.

This project is mostly functional. I highly recommend using the installer, which can be found [here.](https://pastebin.com/NVDXKaZF) The installer can be put on a floppy disk and run from it on multiple computers. Alternatively, it can be run directly on a computer with `pastebin run NVDXKaZF`.

I recommend using an advanced computer with CC:Tweaked for best compatibility, though OC-CC-Kernel should work on a standard computer from the original ComputerCraft.

## Notes

To run OC-CC-Kernel on anything older than CC1.8, you will need to add `os.epoch = os.time` to the beginning of `/boot/oc-cc-kernel/boot.lua`

You will need to patch `/lib/libinterfaces.lua` with a custom `table.unpack` function in order for the shell to work on CC1.5 or older.

OC-CC-Kernel will NOT run on a Standard (non-color) computer on CC1.7 or older. This could probably be fixed with a modification of the EFI it uses in order to load a custom `colors` API that is purely black-and-white.

This has been tested on:

- CCEmu (CC1.5)

- CCEmuRedux (CC1.7)

- CCEmuX (CC1.8)

- CraftOS-PC 2 (CC1.8)
