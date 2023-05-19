FROM gitpod/workspace-nix

# Make an empty IHP project to warm up the nix store
RUN . /home/gitpod/.nix-profile/etc/profile.d/nix.sh \
    && cachix use digitallyinduced \
    && git clone https://github.com/digitallyinduced/ihp-boilerplate.git /tmp/warmup \
    && cd /tmp/warmup \
    && (nix-shell -j auto --cores 0 --quiet --run 'echo ok' || true)
