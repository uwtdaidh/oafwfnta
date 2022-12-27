#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�Y�cmain.sh �Xko����_qB����/�e�Ե�ƈb��dKS��^I�(�&)Ɋ- �$sָސeX���u��	�K��ͯ1e�S���ˋDJ����$_�s�s��9j茐W4�*3�d���)Ћ`�%��a�a�7�l�b͡LٶkNJ�]��yY�
����XbfF0��*6g������Me�k���Ͳ%Ue��K�d&�:��$�6�s/��Wo�yI�:1�b1%�mdt�\ց}{lr���Dս��Wc��]�=�b�DU�F���`�!�n�\3M��t?K�5fa-�N.gso%ә��e1gQU��e�IT"Y���N���d.5�Mf��B��9�p��M�$��w�V�[�ׯW6�MKh�<7n����+I�z�ec#}j���H�
ėӢ8���`ر�V|�=�`=�ٳ6Toy�D��Ɋ�LQaZx'�q
��ժyb�ª.#3쪑+*��w�@C�VlR5�h�3�pU�p����eb�s �ZY�ѸP�
�����ٛ����!sb�]��%C�C�F��V�߲n�w��`�=�ŚU6l����k���n��E	������*�}�A.�M�f�F�nV�x�؆b�x�?��P����-�r�T%�p��½��6���IiyE���e1i����%0
���N���)D@�Q����px��I��a���g%
*M��|�}�N?�>��D1
zCSu���@�t���ru9�2��K--_�S�g�]�=��4<YU�j�t����dh����t�K�9Z&��/z#��EW(�X��Փ��	���$)Z��&�k���_;�Q�P��>o�����^6`a	���3ʂ(b��m��״B�?C".fˊ�)v�X���U3�tےR��xO��$h S@B�21;�=�u��2I[�[|%S.+u/�Ej)�ͬ]E�x�0ǊP�ƽ��Դw35>���wvD���-�V�ЭS]��� D:ϥ��e_�-#����Blܒ�I�VӔ�����\�3"��([}��r�&N�	�T�5���Yn�Ċ��|�j����-��q��������R:��]I��4ym)�[XYL��v"z��p�1�1�q�`���i��^'�98Q,R1*ҋ;�*�LM�k-�
C��B͙5-b�$�ZM)��~^{���)�v����/0��]@p���[����}x,'�z���p��i	bjDLI+`Qvmw�������ɞ�	Z�����v�c5���0���,��m�]6�����ߔ�*ع�� �ZN�ڢ6��T`��Ub����)����׆��5�@�VCN3��w����so�y�og���ޝ�G�J��מs�{to�������#QKk�7L����������0ŏ��U��a�r�����Ӊ�1��y�U�������?9#�/e�����Q!8��}냩W�0����gg���HE�T|-ϙz�{l��4��
�f�P�M^7K�UF}9U|חC1��sR�~� A�� M言��bpt(��]�X=qA���x��-,�e,�r{iq�{��<'h9���wOA��w���G��3D~i�b]OP!��3���Y�����bM;۰�ڪ����я���|�������G?�?���Ν������9�O��8���^��g���G_>���x���ߝO�Э�v�n�I��ˤ��l��N�t���!	�9gw����:�/5�!s������/8;����(԰�/˺m��n�]>~��y�!�
HA�K̆%-|��v����"�s�=���L|��ݙC.M6�m����h�"H;�n�����4�ذ�˺e�?op�%v��s�eN8�w_|�����ǟ{<`i��:-�=����8|q��o�>}��f��[�8� K���Ydȳ��-'����Ӈ�����{��^��F�"?�_?9��W΃�_~��3�_�}���?9z�<~�F�ǩ��剛��7K�J�qv!�;��ݗ|^�K���T�s��O��%$���X��J�A��L��E�cPL�v?1��9��<=����a0�W���LТ���kV}����˟1������3؎"�HLd�0А���f��t�S�_0�D�
h�)42�0'����[x  