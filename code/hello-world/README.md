# Hello World App

## Summary

Simple Hello World containerized application for the Computacenter DevOps Workshop

## Requirements

- Docker
- Python 3 and pip
- docker-compose >= 1.28.6

*Note: All these requirements have been satisfied in the container.*

## Env Deployment

- Download code from GitHub

  ```sh
  git clone https://github.com/[YOUR-GITHUB]/hello-world.git
  ```

  _Note:  If you don't have Git installed you can also just grab the zip:
  [https://github.com/[YOUR-GITHUB]/hello-world/archive/master.zip](https://github.com/[YOUR-GITHUB]/hello-world/archive/master.zip)_

- Launch Hello World containers

  ```sh
  cd ./code/hello-world
  docker-compose up --build
  ```

## Compatibility

This is was built and tested on Ubuntu 20.04 and most likely will only work on any Linux distro.

## Disclaimer

The code provided in this project is an open source example and should not be treated as an officially supported product. Use at your own risk. If you encounter any problems, please log an [issue](https://github.com[YOUR-GITHUB]/hello-world/issues).

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request ツ

## History

- version 0.1.0 (initial release) - 2021/05/03

## Credits

Rich Bocchinfuso <<rbocchinfuso@gmail.com>>

## License

MIT License

Copyright (c) [2021] [Richard J. Bocchinfuso]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
