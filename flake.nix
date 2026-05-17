{
  description = "Dotfiles as a Home Manager module";

  outputs = {self}: {
    homeManagerModules.default = {
      config,
      lib,
      ...
    }:
      with lib; let
        cfg = config.dotfiles;

        listFiles = base: dir: let
          entries = builtins.readDir (base + dir);
        in
          concatMap (name: let
            path = dir + "/${name}";
          in
            if entries.${name} == "directory"
            then listFiles base path
            else [path])
          (attrNames entries);

        mkPackageFiles = pkg:
          listToAttrs (map (relPath: {
            name = removePrefix "/" relPath;
            value = {source = self + "/${pkg}" + relPath;};
          }) (listFiles (self + "/${pkg}") ""));
      in {
        options.dotfiles = {
          enable = mkEnableOption "dotfiles";
          packages = mkOption {
            type = types.listOf types.str;
            default = [];
            description = "Stow packages to symlink into home directory";
          };
        };

        config = mkIf cfg.enable {
          home.file = foldl' (acc: pkg: acc // mkPackageFiles pkg) {} cfg.packages;
        };
      };
  };
}
