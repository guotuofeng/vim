import os
import re
import subprocess

git_bundles = [
    "https://github.com/tpope/vim-repeat",
    "https://github.com/jlanzarotta/bufexplorer",
    # "https://github.com/jalcine/cmake.vim",
    # "https://github.com/kien/ctrlp.vim",
    "https://github.com/ctrlpvim/ctrlp.vim",
    "https://github.com/Raimondi/delimitMate",
    "https://github.com/tomasr/molokai",
    "https://github.com/yegappan/mru",
    "https://github.com/Shougo/neocomplete.vim",
    "https://github.com/scrooloose/nerdtree",
    "https://github.com/klen/python-mode",
    "https://github.com/hdima/python-syntax",
    "https://github.com/ervandew/supertab",
    "https://github.com/majutsushi/tagbar",
    "https://github.com/tomtom/tcomment_vim",
    "https://github.com/bling/vim-airline",
    "https://github.com/altercation/vim-colors-solarized",
    "https://github.com/OrangeT/vim-csharp",
    "https://github.com/junegunn/vim-easy-align",
    "https://github.com/Lokaltog/vim-easymotion",
    "https://github.com/pangloss/vim-javascript",
    "https://github.com/PProvost/vim-ps1",
    "https://github.com/kshenoy/vim-signature",
    "https://github.com/tpope/vim-surround",
    "https://github.com/tpope/vim-unimpaired",
    "https://github.com/othree/xml.vim"
    # "https://github.com/mileszs/ack.vim",
    # "https://github.com/chrisbra/csv.vim",
    # "https://github.com/tpope/vim-fugitive",
    # "https://github.com/tacahiroy/ctrlp-funky",
    # "https://github.com/sjl/gundo.vim",
    # "https://github.com/leafgarland/typescript-vim",
    # "https://github.com/tpope/vim-markdown",
    # "https://github.com/spiiph/vim-space",
]

if __name__ == '__main__':
    bundles_dir = os.path.dirname(os.path.abspath(__file__))
    os.chdir(bundles_dir)

    for url in git_bundles:
        patten = re.compile(r'(?<=/)([^/]+?)$')
        m = re.search(patten, url)
        dir = m.group(0)
        if os.path.exists(dir):
            cmd = 'cd %s&&git pull&&cd ..' % (dir)
            print cmd
            # os.system(cmd)
            # subprocess.Popen(cmd, shell=True).wait()
            subprocess.call(cmd, shell=True)
        else:
            # os.system("git clone %s" % url)
            subprocess.call("git clone %s" % url)
