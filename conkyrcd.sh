#!/bin/bash

# TODO                               # parameter
# [v] tanggalan hari bulan             waktu
# [v] siangmalam                       siangmalam
# [ ] hijri                            hijri
# [ ] imsakiyah                        imsakiyah
# [ ] greeting                         greet
# [ ] cek koneksi                      koneksi
# [ ] conan?                           conan?
# [ ] cek server                       server
# [ ] kernel checker                   kernel
# [ ] cek cache                        cache
# [ ] updatemon                        update
# [ ] last update last scanpackages    update?
# [ ] dmesg                            dmesg

# ------------------------------------------------------------

function setup() {
   hari=$(date +%u)
   tanggal=$(date +%d)
   bulan=$(date +%m)
   tahun=$(date +%Y)
   jam=$(date +%H)
}

# waktu
# ------------------------------------------------------------
function waktu_namaBulan()
{  
   case "$1" in
   "01")
      namabulan="Januari"
   ;;
   "02")
      namabulan="Februari"
   ;;
   "03")
      namabulan="Maret"
   ;;
   "04")
      namabulan="April"
   ;;
   "05")
      namabulan="Mei $tahun"
   ;;
   "06")
      namabulan="Juni $tahun"
   ;;
   "07")
      namabulan="Juli $tahun"
   ;;
   "08")
      namabulan="Agustus"
   ;;
   "09")
      namabulan="September"
   ;;
   "10")
      namabulan="Oktober"
   ;;
   "11")
      namabulan="November"
   ;;
   "12")
      namabulan="Desember"
   ;;
   *)
      namabulan=$bulan
   ;;
   esac
   
   echo "$namabulan"
}

# tampilkan nama hari
function waktu_namaHari()
{  
   case "$1" in
   "1")
      namahari="Senin"
   ;;
   "2")
      namahari="Selasa"
   ;;
   "3")
      namahari="Rabu"
   ;;
   "4")
      namahari="Kamis"
   ;;
   "5")
      namahari="Jumat"
   ;;
   "6")
      namahari="Sabtu"
   ;;
   "7")
      namahari="Minggu"
   ;;
   *)
      namahari=""
   ;;
   esac
   
   echo "$namahari"
}

# cetak hari, tanggal bulan tahun
function waktu_hariIni()
{
   waktu_namaBulan $bulan > /dev/null
   waktu_namaHari $hari > /dev/null
   echo "$namahari, $tanggal $namabulan $tahun"
}

function waktu_() {
   case "$1" in
      "namahari")
         if [ -z "$2" ]; 
         then
            waktu_namaHari $hari
         else
            waktu_namaHari $2
         fi
      ;;
      "hari")
         waktu_namaHari $hari > /dev/null
         echo $namahari
      ;;
      "tanggal")
         echo $tanggal
      ;;
      "bulan")
         if [ -z "$2" ]; 
         then
            waktu_namaBulan $bulan
         else
            waktu_namaBulan $2
         fi
      ;;
      "tahun")
         echo $tahun
      ;;
      "hariini")
         waktu_hariIni
      ;;
      
      "")
         waktu_namaHari $hari > /dev/null
         waktu_namaBulan $bulan > /dev/null
         echo "Hari ini: $namahari, $tanggal $namabulan $tahun"
      ;;
      
      --help|-h|help)
         echo "help belum tersedia :D"
      ;;

   esac
}

# siangmalam
# ------------------------------------------------------------
siangmalam_cek()
{
   case "$jam" in
   01|02)
      greet="dini hari"
   ;;
   03|04|05|06|07|08|09|10)
      greet="pagi"
   ;;
   15|16|17|18)
      greet="sore"
   ;;
   19|20|21|22|23)
      greet="malam"
   ;;
   *)
      greet="malam"
   ;;
   esac  
}

siangmalam_() {
   siangmalam_cek
   echo $greet
}

# main
# ------------------------------------------------------------
setup
case "$1" in
   "waktu" )
      shift
      waktu_ "$@"
   ;;
   "siangmalam" )
      shift
      siangmalam_
   ;;
esac