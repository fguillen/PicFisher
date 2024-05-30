# TODO

- Create the output directory if it doesn't exist. Or add a parameter to allow the user to decide this.
- Check if the Downloader is going to overwrite a file that already exists. Add an option to `force` if not stop with an error.
- Add a progress bar for the downloading phase.
- Allow multiple concurrent downloads. Add an extra param to decide the number, default `5`
- Add error handling to the Downloader. Many things can be wrong when connecting to the internet.
- Allow URLs without image extension. This requires the source urls file to have a predictable estructure. Or we request all the images and check the media type of the response.
