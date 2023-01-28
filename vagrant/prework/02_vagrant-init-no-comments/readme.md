# `vagrant init` bez komentarzy

Plik [Vagrantfile](./Vagrantfile) w tym folderze nie występuje. Mamy natomiast [skrypt](./clean_hash_comments.sh), który weźmie [Vagrantfile z poprzedniej części](../01_vagrant-init/Vagrantfile) i usunie z niego wszystkie komentarze przy wykorzystaniu [`sed`](https://man7.org/linux/man-pages/man1/sed.1.html) i [wyrażeń regularnych](https://regexr.com/).


Możecie ten skrypt uruchomić, żeby zobaczyć jak prosty jest wynik `vagrant init`. Możecie zerknąć jak jest napisany jako ciekawostka, ale nie będziemy się bardzo w niego zagłębiać.