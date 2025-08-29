{ self, pkgs, ... }:
{
    security.pam.services.sudo_local.touchIdAuth = true;
    system = {
        stateVersion = 6;

        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;
        defaults = {
          dock.autohide = true;
          NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
        };
    };
}