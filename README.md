# recordurbate-docker
Headless docker for Recordurbate

Download and change configs from https://github.com/oliverjrose99/Recordurbate/tree/master/recordurbate/configs

Add volume/mount with custom configs to `/app/recordurbate/configs`
Add volume/mount for output videos to `/app/recordurbate/videos`

You can run any of Recordurbate's commands in the docker's shell, using the `rb` alias. For example:
`rb add somemodel`. Full list of commands are found [here](https://github.com/oliverjrose99/Recordurbate#usage)
