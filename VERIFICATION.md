# Verification — 2 October 2026

Latest update (2 October): refreshed the bank role in both CV variants and both
portfolios, covering backend architecture, financial data integrity, maintainable
applications, identity workflows, and production reliability. Both CVs retain
six concise bank-role bullets and two pages. All three production builds pass;
all four CV pages were rendered and visually reviewed, with no compiler warnings
or overfull/underfull boxes. Dean's List remains two semesters.

The checks below were completed on 1 October, before these updates.

## Current CVs

- Exactly two maintained LaTeX entry points and named output PDFs: Software
  Engineering and Computer Vision. Standalone AI4SE and SE4AI variants retired.
- `bash CV/build.sh` passed with XeLaTeX through latexmk. Both PDFs contain two
  US letter pages; no LaTeX warnings, overfull boxes, or underfull boxes.
- All four final pages rendered and visually reviewed after the latest changes.
- References removed from both CVs and both portfolios at the user's request.
- Rust appears in programming languages across all three projects. MySQL removed
  from skills and experience text. Itransition is labeled `.NET Development
  Training Program`; the unrelated BigLedger internship remains unchanged.
- PDF text checks confirm Rust and the training-program label, with no References,
  MySQL, or Intern .NET wording. Publications, research, projects, ML skills,
  education, dates, and other professional experience remain intact.

## Current portfolio builds

- Academic production build and both tests pass.
- Professional GitHub Pages production build and all four tests pass. Build uses
  network access for its existing Google Fonts dependency.
- References navigation, page/section, and referee data removed. The professional
  navigation test now expects the remaining seven links.
- No redesign or deployment-configuration changes. Neither site offers CV
  downloads; the two PDFs remain local deliverables.
- Git whitespace checks pass in all three repositories. No push or deployment.

## Earlier verification in this update

Before the latest content corrections, Chrome checked both sites at 1440, 390,
and 320 pixels with no horizontal overflow, broken section anchors, or runtime
errors. Existing site styles remain unchanged.

All 18 distinct HTTPS content targets were checked: 17 returned HTTP 200,
including publication documents, Scholar, GitHub, ORCID, project demos, Colab,
Coursera, and both live portfolios. LinkedIn returned HTTP 999 and remains
unverified beyond preservation of its original URL. No external URLs changed
in the latest correction. Reachability does not establish authenticated access.
