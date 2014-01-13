#!/bin/bash

# TODO                               # parameter
# [v] tanggalan hari bulan             waktu
# [v] siangmalam                       siangmalam
# [ ] hijri                            hijri
# [ ] imsakiyah                        imsakiyah
# [v] greeting                         greet
# [v] cek koneksi                      koneksi
# [ ] conan?                           conan?
# [ ] cek server                       server
# [ ] kernel checker                   kernel
# [ ] cek cache                        cache
# [ ] updatemon                        update
# [ ] last update last scanpackages    update?
# [ ] dmesg                            dmesg

# ----------------------------------------------------------------------

function setup() {
   hari=$(date +%u)
   tanggal=$(date +%d)
   bulan=$(date +%m)
   tahun=$(date +%Y)
   jam=$(date +%H)
}

# waktu
# ----------------------------------------------------------------------
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
# ----------------------------------------------------------------------
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

# greeting
# ----------------------------------------------------------------------
greeting_cek()
{
      case "$jam" in
      01)
         greet="Lagi lembur ya? jgn tidur malem-malem loo.."
      ;;
      02)
         greet="Stop lemburnya bos, cepetan tidur..! @.@"
      ;;
      03)
         greet="Nanggung deh kalo jam segini tidur.."
      ;;
      04)
         greet="Udah sholat subuh apa belom bos?"
      ;;
      05)
         greet="Tumben pagi-pagi gini dah bangun? :D"
      ;;
      06)
         greet="Udah sikat gigi belum nih? bau :("
      ;;
      07)
         greet="Udah mandi bos..? Cuci muka gitu..??"
      ;;
      08)
         greet="Sarapan apa yaa..? (padahal mandi aja belum)"
      ;;
      09)
         greet="Ayo kerja kerjaaa..!!! (Semangat Mode: ON)"
      ;;
      10)
         greet="Masak jam segini udah laper lagi sih bos..??!"
      ;;
      11)
         greet="Jam segini kok bawaannya udah ngantuk ya? :("
      ;;
      12)
         greet="Sholat Dzuhur.. terus Tiduuuurrr.. :D"
      ;;
      13)
         greet="Sudah sholat Dzuhur?.. Kok jadi ngantuk ya.. :("
      ;;
      14)
         greet="Jam segini sih paling enak tidur bos.. :D"
      ;;
      15)
         greet="Sudah sholat Ashar pa belum ni bos..?"
      ;;
      16)
         greet="Ashar-nya udah?.. Perut mulai laper lagi.. -_-"
      ;;
      17)
         greet="Mandi mandi sono dulu, biar seger dikit.."
      ;;
      18)
         greet="Sholat Maghribnya sudah bos..?"
      ;;
      19)
         greet="Sholat Isya' udah? Saatnya makan.. :D"
      ;;
      20)
         greet="Enaknya belajar apa nonton film ya..? :D"
      ;;
      21)
         greet="Isya' | Jam segini.. masih soree... :D"
      ;;
      22)
         greet="Isya' | Mata udah mulai ngantuk... >_<"
      ;;
      23)
         greet="Belum ngantuk bos? Hwoooaaaahm... >_<"
      ;;
      *)
         greet="Zzz.. Zzz.. (-_-) Zzz.. Zzz.."
      ;;
      esac  
}

greeting_hari_jumat()
{
   case "$hari" in
      # Siap-siap jumatan
      5) #5=jumat
         if [ "$jam" = "11" ]; then
               greet="Ayo siap-siap sholat Jumat dulu bos.."
            else
            if [ "$jam" = "12" ]; then
               greet="Habis Jumatan gini enaknya ya tidur :D"
               else
               if [ "$jam" = "13" ]; then
                     greet="Jumat siang, buat tidur mantap nih :D"
               fi
            fi
         fi
      ;;
   esac 
}

greeting_ramadhan() {
   case "$jam" in
      01)
         greet="Jam segini melek, mau ronda ya bos?"
      ;;
      02)
         greet="Ronda.. Ronda.. SAHUUURRR...!! "
      ;;
      03)
         greet="Ayo Sahuuuur.. Sahuurrrr...!"
      ;;
      04)
         greet="Imsyaaak..! Ayo Sholat Subuh jamaah.."
      ;;
      05)
         greet="Pagi hari di bulan Ramadhan.. Segerr.."
      ;;
      06)
         greet="Selamat pagi.. :) Semangat Ramadhan ^_^"
      ;;
      07)
         greet="Selamat pagi.. :) Semangat Ramadhan ^_^"
      ;;
      08)
         greet="Mau aktifitas apa hari ini? Semangat yaa :)"
      ;;
      16)
         greet="Ashar-nya udah? ~ Bentar lagi buka puasa :)"
      ;;
      17)
         greet="Alhamdulillah..! Sebentar lagi buka puasa T.T"
      ;;
      18)
         greet="Buka puasa.. Jangan kebanyakan makan ya ^_^"
      ;;
      19)
         greet="Ayo siap-siap sholat traweh jamaah.. :)"
      ;;
      20)
         greet="Besok makan sahur pake apa yaa..??"
      ;;
      21)
         greet="Tidur awal bos.. biar besok ndak telat sahur.."
      ;;
      22)
         greet="Ndang tidur,, besok jangan telat sahur lo..."
      ;;
      23)
         greet="Begadang sampe sahur apa tidur nih?"
      ;;
   esac
}

greeting_()
{
   greeting_cek
   greeting_hari_jumat
   echo $greet
}

# koneksi
# ----------------------------------------------------------------------
function koneksi_() {
   if eval "ping -c 1 8.8.4.4 -w 2 > /dev/null 2>&1"; then
     echo "Siip, terhubung dengan internet.. Online.. Online... :D"
   else
     echo "Tidak terhubung dengan internet.. payah.. :("
   fi 
}


# main
# ----------------------------------------------------------------------
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
   "greeting" )
      shift
      greeting_
   ;;
   "koneksi" )
      shift
      koneksi_
   ;;
esac
