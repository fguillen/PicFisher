# TODO

- If the output directory doesn't exist, create it. We can also add a parameter to allow the user to decide on this.
- Check if the Downloader is going to overwrite a file that already exists. Add an option to `force` if not stop with an error.
- Add a progress bar for the downloading phase.
- Allow multiple concurrent downloads. Add an extra param to decide the number, default `5`
✔ Add error handling to the Downloader. Many things can be wrong when connecting to the internet.
- Allow URLs without image extension. This requires the URLs' source file to have a predictable structure. Or we request all the images and check the media type of the response.
- If we pass an URL instead of a file path, the script will detect it, download the URL, and extract the images from there.
- Pass Rubocop cops
