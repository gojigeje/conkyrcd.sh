conkyrcd.sh
===========

Simple bash script to display various system information. Intended to use with conky as external script so it's really easy to build simple but informative conky like this:

![conkyrcd.jpg](https://raw.github.com/gojigeje/conkyrcd.sh/master/conkyrcd.jpg "conkyrcd.jpg")

This script will provide additional output for your conky. See the **yellow-colored** marks on the screenshot. The green one are available from another script:

- [hijri.sh](https://github.com/gojigeje/hijri.sh) -- to display current date in Islamic date (hijri / hijriyah)
- [imsakiyah.sh](https://github.com/gojigeje/imsakiyah.sh) -- to display today's praying time (waktu sholat)
- [kernel-mainline-checker.sh](https://github.com/gojigeje/kernel-mainline-checker.sh) -- to check stable and RC mainline kernel from ubuntu kernel ppa website.

#### USAGE
* Make script executable
* Call script using _exec_/_execi_ tag in your conky config.

```bash
${exec bash /path/to/conkyrcd.sh parameters} , or
${execi 5 bash /path/to/conkyrcd.sh parameters subparameter}
```

#### PARAMETERS / ARGUMENTS
In order to display conkyrcd output on your conky, you'll need to call conkyrcd using _exec_/_execi_ tag in your conky config with some parameters/arguments. There are some parameters avalilable:

| Parameter | Function | Sub-parameter | 
| --- | --- | --- |  
| `waktu` | display current date, also localized day name and month name in Bahasa Indonesia | `waktu` `hari` `tanggal` `bulan` `tahun` |
| `siangmalam`| display current state if the day, it will output (dinihari / pagi / siang / sore / malam). | _none_ |
| `greeting`| display some greetings that dynamically changed every hour | _none_ |
| `koneksi`| display internet connection status | _none_ |
| `server`| display service status, it simply output ON / OFF | `httpd` `mysqld` `ftpd` `sshd` `named` `logkeys` `nginx` |
| `cache`| display apt-get cache folder status, it counts the number of .deb file and their total size | _none_ |

#### OUTPUT
_For this example, Im going to run conkyrcd on terminal to show you the output, you still have to call it from your conky config to actually display it on your conky._

##### `waktu`
```bash
$ ./conkyrcd.sh waktu
Hari ini: Senin, 20 Januari 2014
$ ./conkyrcd.sh waktu hari
Senin
$ ./conkyrcd.sh waktu tanggal
20
$ ./conkyrcd.sh waktu bulan
Januari
$ ./conkyrcd.sh waktu tahun
2014
```

##### `siangmalam`
```bash
# at noon
$ ./conkyrcd.sh siangmalam
siang

# at night
$ ./conkyrcd.sh siangmalam
malam
```

##### `greeting`
```bash
$ ./conkyrcd.sh greeting
Lagi lembur ya? jgn tidur malem-malem loo..
```

##### `koneksi`
```bash
# when internet connection is available
$ ./conkyrcd.sh koneksi
Siip, terhubung dengan internet.. Online.. Online... :D

# when internet connection is unavailable
$ ./conkyrcd.sh koneksi
Tidak terhubung dengan internet.. payah.. :(
```

##### `server`
```bash
# http server
$ ./conkyrcd.sh server httpd
ON

# ftp server
$ ./conkyrcd.sh server ftpd
OFF
```

##### `cache`
```bash
# when cache is clean
$ ./conkyrcd.sh cache
Tidak ada file .deb baru di cache..

# when cache is filled
$ ./conkyrcd.sh cache
Ada 3 file .deb di cache  -  Total: 15M  -->  backup / cleanup ?
```

_Hack the script :)_
