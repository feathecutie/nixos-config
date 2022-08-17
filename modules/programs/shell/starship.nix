{
  users.fea.programs.starship =
    let
      purple = "#9A348E";
      pink = "#DA627D";
      orange = "#FCA17D";
      light_blue = "#86BBD8";
      cyan = "#09696A";
      dark_blue = "#33658A";
    in
    {
      enable = true;
      settings = {
        format = "[](${purple})$username[](bg:${pink} fg:${purple})$directory[](fg:${pink} bg:${orange})$git_branch$git_status[](fg:${orange} bg:${light_blue})$c$elixir$elm$golang$haskell$java$julia$nodejs$nim$rust[](fg:${light_blue} bg:${cyan})$docker_context[](fg:${cyan} bg:${dark_blue})$time[ ](fg:${dark_blue})";
        username = {
          show_always = true;
          style_user = "bg:${purple}";
          style_root = "bg:${purple}";
          format = "[$user ]($style)";
        };
        directory = {
          style = "bg:${pink}";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
          substitutions = {
            Documents = " ";
            Downloads = " ";
            Music = " ";
            Pictures = " ";
          };
        };
        c = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        docker_context = {
          symbol = " ";
          style = "bg:${cyan}";
          format = "[ $symbol $context ]($style) $path";
        };
        elixir = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        elm = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        git_branch = {
          symbol = "";
          style = "bg:${orange}";
          format = "[ $symbol $branch ]($style)";
        };
        git_status = {
          style = "bg:${orange}";
          format = "[$all_status$ahead_behind ]($style)";
        };
        golang = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        haskell = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        java = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        julia = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        nodejs = {
          symbol = "";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        nim = {
          symbol = " ";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        rust = {
          symbol = "";
          style = "bg:${light_blue}";
          format = "[ $symbol ($version) ]($style)";
        };
        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:${dark_blue}";
          format = "[ ♥ $time ]($style)";
        };
      };
    };
}
