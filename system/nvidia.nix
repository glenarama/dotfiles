{ config, lib, pkgs, ... }:
{

  # Enable OpenGL
  hardware.graphics = {
    enable32Bit = true;
    enable = true;
 };
 environment.variables = {
    "LIBVA_DRIVER_NAME"="nvidia";
    "GBM_BACKEND"="nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME"="nvidia";
    "XDG_SESSION_TYPE"="wayland";
    "XDG_SESSION_DESKTOP"="Hyprland";
    "QT_QPA_PLATFORM"="wayland";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION"="1";
    "QT_AUTO_SCREEN_SCALE_FACTOR"="1";
    "MOZ_ENABLE_WAYLAND"="1";
    "ELECTRON_OZONE_PLATFORM_HINT"="auto";
    "NIXOS_OZONE_WL"="1";
    "GDK_SCALE"="1";
    "__GL_SHADER_CACHE" = "1";
    "__GL_THREADED_OPTIMIZATION" = "1";
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;

  };
}
