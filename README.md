<center>

![Demo](.media/header.png)

</center>

# vLang : PPM

Create PPM image file from vLang

## Usage

```v

mut c := Canva.new(10, 10)
color := Color.new(255, 204, 153)
for row in 0..c.height {
    for col in 0..c.width {
        c.set(row, col, color)
    }
}

c.save("canva.ppm") // will save your canva to "canva.ppm" file

```

## Installation

Install and use ppm module via VPM:

v install Ni-g-3l.ppm

Or through Git:

git clone https://github.com/Ni-g-3l/vlang-ppm.git ~/.vmodules/ppm


## 🔢 Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Ni-g-3l/vlang-ppm/tags).

## 🤹 Authors / Contributers / Attributions

* **Ni-g-3l** - *Main Developer* - [Github](https://github.com/Ni-g-3l/)

See also the list of [contributors](https://github.com/Ni-g-3l/rez-init/contributors) who participated in this project.

## 📃 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## 👏 Acknowledgments

* **Billie Thompson** - *README & Contribution Templates* - [PurpleBooth](https://github.com/PurpleBooth)
