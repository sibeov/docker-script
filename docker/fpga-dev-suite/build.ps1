$script_path = (Resolve-Path $PSScriptRoot).Path
$root_path = (Resolve-Path "$script_path/../../").Path
$output_path = (Resolve-Path "$root_path/out").Path
$docker_file = Get-ChildItem ./fpga-dev-suite.Dockerfile
$image_version = Get-Content ./version
$image_name = ($docker_file).BaseName

docker build -t "$image_name":"$image_version"
             -t "$image_name":"latest"
			 -o "$output_path"
			 -f ($docker_file).Name $output_path