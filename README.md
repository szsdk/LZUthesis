# 兰州大学本科毕业论文LaTeX模板

这是一个**非官方的**兰州大学本科毕业论文LaTeX模板。

## 安装

在 [Release](https://github.com/szsdk/LZUthesis/releases) 中下载名为
`LZUThesis_XXX.zip`的文件解压即可。其中`XXX`是版本号，通常请下载最新版。

## 使用

模板的具体使用参见压缩包内的`帮助文档.pdf`。

### Windows 用户
运行`compile.bat`，即可编译`simplest.tex`。

### Linux 用户
直接`make`即可。
```bash
make #编译 simplest.tex
make clean #清除中间文件
```



## 关于帮助文档`template.tex`的编译

因为官方的pygments中没有bibtex的lexer，所以需要先安装
Marco D. Adelfio的bibtex-pygments-lexer 0.0.1。

```bash
pip install bibtex-pygments-lexer
```

安装之后，就可以通过

```bash
make all
```

编译帮助文档
