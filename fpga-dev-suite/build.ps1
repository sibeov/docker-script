$root_path = "../.."
$output_path = "$root_path/out"
$docker_file = Get-ChildItem ./fpga-dev-suite.Dockerfile
$image_version = Get-Content ./version
$image_name = ($docker_file).BaseName

Write-Verbose "Building Docker image $image_name : $image_version from $(($docker_file).Name)"
docker build -t "$($image_name):$($image_version)" `
             -t "$($image_name):latest" `
			 --no-cache `
             -o $output_path `
             -f ($docker_file).Name $root_path