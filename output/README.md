# output 目录规则

`output/` 是项目级对外交付区，不是当前论文的日常 LaTeX 编译输出目录。

使用规则：

- 当前主轴论文的 PDF 输出固定放在 `paper/output/`。
- LaTeX 中间文件固定在 `paper/build/` 临时生成，并在成功编译后删除。
- 只有明确要对外发送、提交或打包的项目级最终材料，才放入 `output/`。
- 旧输出已经归档到 `oldfiles/output/`。
