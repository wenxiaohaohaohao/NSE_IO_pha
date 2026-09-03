# Financing Revision PDF Render Audit

Date: 2026-09-03  
Renderer: Poppler `pdftoppm`, 120 dpi  
Temporary render directory: `paper/tmp/pdfs/financing_revision/`

## Pages inspected

- Main manuscript: pp. 1, 6, 7, 8 and 14.
- Technical appendix: pp. 1, 10, 18, 19, 20 and 35.
- Main p. 7 was re-rendered after the final prose/layout correction.

## Result

`PDF_RENDER_AUDIT=PASS`

- Titles, margins, page numbers and section hierarchy are intact.
- The finance-adjusted route-value cases are legible and not clipped.
- The four main-text propositions and financing-corridor inequalities fit
  within the text block.
- Appendix equations, proofs and references are legible, with no overlapping
  objects, black boxes, missing glyphs or truncated lines.
- The final LaTeX logs report zero overfull or underfull boxes.
