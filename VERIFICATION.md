# Delivery verification

Verified on 12 September 2026 against the attached original CV PDF and the
explicit portfolio URL and positioning instructions in the request.

- Both final PDFs contain exactly **2 US letter pages**.
- Compiled with **Tectonic 0.17.0**. No LaTeX warnings, overfull boxes, or
  underfull boxes appeared in the final compiler logs.
- Visually inspected all four final pages after refinement: consistent dates
  and bullets, readable publication entries, intact references, no clipping or
  stranded section headings. The current bank role ends on page one; internships
  begin page two. Body text is 10.5 pt with 13 pt line spacing.
- Fonts are embedded, subsetted Latin Modern fonts with Unicode maps.
  The PDFs contain no raster images. Text extraction was checked with both
  Poppler and pypdf, including ordinary text in Officer, EfficientNet-B0,
  PyTorch, and the section headings.
- Extracted text follows the requested section order in both variants.
- All original link targets used in each variant are preserved. The CV variant
  has 12 unique URI targets; the SE variant has 13, including the task project.
  Both also include the supplied academic portfolio and a clickable phone link.
- Both publication sites, the academic portfolio, GitHub, the task project,
  and the two Colab landing pages responded successfully. This verifies URL
  reachability, not notebook sharing permissions. LinkedIn returned its
  automated-access restriction (HTTP 999); its original source URL is retained.
  Email/phone actions were checked as PDF links; no messages or calls were made.

The academic record remains Computer Vision research in both variants.
Software Engineering and AI-enabled software research are described as
interests, with enterprise software contributions supported by the original CV.
The proceedings item is identified as a **Proceedings Publication**, because the
source does not establish a named conference or a journal article. All three
original referees, their titles, affiliations, and emails are retained.

The generated logs, extracted text, renderings, and machine-readable checks are
local intermediates in `build/` and are excluded from the source archive. The
pdfLaTeX compatibility branch is provided but was not executed in this
environment; XeLaTeX on Overleaf most closely matches the Tectonic build.
