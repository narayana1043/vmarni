################# Terminal Settings ##########################
# make terminal case insenstive
# If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it won't get overriden
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add shell-option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc

# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:/Users/vmarni/.local/bin:/Users/vmarni/softwares/elasticsearch-6.2.4/bin:/Users/vmarni/softwares/kibana-6.2.4/bin:/Users/vmarni/softwares/logstash-6.2.4/bin
export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for hadoop
export HADOOP_HOME=~/softwares/hadoop/
export PATH=$HADOOP_HOME/bin:$PATH

############ spark config #################
# Setting PATH for spark
export SPARK_HOME=~/softwares/spark
export PYSPARK_PYTHON=python3
export PYSPARK_DRIVER_PYTHON=python3
export PATH=$SPARK_HOME/bin:$PATH

# Setting PATH for pyspark driver
#export PYSPARK_DRIVER_PYTHON=jupyter
#export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
#export PYSPARK_SUBMIT_ARGS="--packages com.databricks:spark-xml_2.11:0.4.1 pyspark-shell"

# added by Miniconda3 installer
# export PATH="/Users/vmarni/miniconda3/bin:$PATH"  # commented out by conda initialize

# setting language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# python path
export PYTHONPATH="${PYTHONPATH}"
export PATH=$PATH:/usr/local/mysql/bin

############ emacs config #####################
# task juggler
export PATH=${PATH}:/usr/local/bin/tj3
export WORKON_HOME=~/miniconda3/envs/

############ gremlin config #################
export PATH=${PATH}:~/softwares/gremlin/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/vmarni/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/vmarni/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/vmarni/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/vmarni/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

