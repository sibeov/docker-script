$root_path = "../"
$output_path = "$root_path/out"
$docker_file = "./Dockerfile"
$image_version = Get-Content ./version
$image_name = "fpga-dev-suite"

Write-output "Building image $($image_name):$($image_version)"
docker build . `
			 -t "$($image_name):$($image_version)" `
			 -t "$($image_name):latest" `
			 --no-cache `
			 -f $docker_file