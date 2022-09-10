{
  users.fea =
    { pkgs
    , ...
    }:
    let
      lutris-unwrapped = pkgs.lutris-unwrapped.overrideAttrs (previousAttrs: {
        src = pkgs.fetchFromGitHub {
          owner = "lutris";
          repo = "lutris";
          rev = "d350cd7d29c79acaeddfa846dbd118c5385141a4";
          sha256 = "sha256-Mo/2sxFUC7tRZBZXKS19q1VnSfRaNIy3fdvvJPR/Tfo=";
        };
        propagatedBuildInputs = previousAttrs.propagatedBuildInputs ++ [ pkgs.python310Packages.pypresence ];
      });
    in
    {
      home.packages = [ (pkgs.lutris.override { inherit lutris-unwrapped; }) ];
    };
}
