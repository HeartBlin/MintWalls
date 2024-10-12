{ inputs, ... }:

{
  imports = [ inputs.pre-commit-hooks.flakeModule ];

  perSystem = _: {
    pre-commit = {
      settings = {
        excludes = [ "flake.lock" ];
        hooks = {
          deadnix = {
            enable = true;
            verbose = true;
            fail_fast = true;

            # This is here since in /parts/module
            # there is a config that perSystem actually
            # uses but deadnix flags it as unused
            settings = {
              noLambdaPatternNames = true;
              noLambdaArg = true;
            };
          };

          nixfmt-classic = {
            enable = true;
            verbose = true;
            fail_fast = true;
          };

          statix = {
            enable = true;
            verbose = true;
            fail_fast = true;
          };
        };
      };
    };
  };
}
