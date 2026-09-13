# Saad Kabir Uddin — PhD CVs

Two academic CV variants share one set of factual records. Both use a custom
`article` layout with US letter paper, Latin Modern fonts, 10.5 pt body text,
single-column reading order, and clickable links. No shell escape is required.
XeLaTeX and Tectonic use `fontspec` with explicitly selected Latin Modern OTF
files and common ligatures disabled for text extraction. The pdfLaTeX path uses
T1 encoding, `lmodern`, and `glyphtounicode` mappings instead.

## Files and maintenance

```text
cv/
├── cv-computer-vision.tex          # Computer Vision entry point
├── cv-software-engineering.tex     # Software Engineering entry point
├── commands.tex                   # Packages, typography, layout, entry macros
├── shared/
│   ├── common-data.tex             # Name, contact links, reusable common facts
│   ├── document.tex                # One section order for both variants
│   ├── header.tex                  # Contact layout
│   ├── publications.tex            # Publication records and links
│   ├── research-experience.tex     # Undergraduate research
│   ├── education.tex               # Degree, grades, thesis, Dean's List
│   ├── professional-experience.tex # Roles, dates, employers, shared work bullets
│   ├── projects.tex                # Canonical project records and descriptions
│   ├── skills.tex                  # Canonical skill category contents
│   └── references.tex              # Referee names, titles, affiliations, emails
├── variants/
│   ├── cv-research-interests.tex
│   ├── se-research-interests.tex
│   ├── cv-projects.tex             # Project selection and emphasis
│   ├── se-projects.tex
│   ├── cv-skills.tex               # Skill category order
│   └── se-skills.tex
├── build.sh
├── .gitignore
├── README.md
├── .tools/                        # Ignored local compiler/cache; outside source ZIP
├── build/                         # Generated compiler files and logs
└── output/pdf/                    # Named PDF deliverables
```

Change a phone number, email, profile URL, university name, thesis title, or
current employer in `shared/common-data.tex`. Edit a publication, role, degree,
project, skill category, or referee in its corresponding `shared/` file. These
records are used by both variants, so factual changes only need one edit.

The main files set `\ifcvfocus` and load `shared/document.tex`. Variant files
select or order shared project and skill macros; keep factual records in the
shared files. Research Interests is the exception: each variant has its own
short line in `variants/*-research-interests.tex`. These lines describe research
interests, not additional publications or prior research achievements.

Both variants always follow this order, controlled by `shared/document.tex`:

1. Header / Contact Information
2. Research Interests
3. Publications
4. Research Experience
5. Education
6. Professional Experience
7. Selected Projects
8. Technical Skills
9. References

The Computer Vision variant places Computer Vision first in Research Interests,
gives image segmentation more detail, omits the lower-priority Task Management
Tool, and lists Machine Learning & Computer Vision skills first. The Software
Engineering variant places Software Engineering first in Research Interests,
emphasizes enterprise work through bullet order, retains a brief Task Management
Tool entry after the research projects, and lists programming and software skills
before machine learning skills. Publications remain the same Computer Vision
research record in both versions. The bank role's shared bullets and their
focus-dependent order live in `shared/professional-experience.tex`.

## Build locally

Use a TeX distribution providing `xelatex` or `pdflatex` and the packages listed
in `commands.tex`, or follow the [official Tectonic installation guide](https://tectonic-typesetting.github.io/book/latest/installation/).
`latexmk` is optional. From this workspace's repository root:

```bash
bash cv/build.sh
```

The source archive contains the contents of `cv/` directly at its root. After
extracting it, change into the extracted folder and run:

```bash
bash build.sh
```

The script also works from any directory when called with its absolute path.
An explicit `TECTONIC` environment variable takes precedence over all installed
compilers. Otherwise, the script tries `latexmk` with XeLaTeX, XeLaTeX twice,
`latexmk` with pdfLaTeX, pdfLaTeX twice, Tectonic on `PATH`, then a project-local
`.tools/tectonic`. The current workspace includes that ignored portable compiler
and its TeX cache, so `bash cv/build.sh` works here without special environment
variables. The local fallback sets `XDG_CACHE_HOME` to `.tools/cache` to reuse
the bundled cache for offline rebuilding.

The source ZIP excludes `.tools/`; users of the extracted ZIP need an installed
TeX distribution or Tectonic, or can upload the project to Overleaf. To select a
portable Tectonic binary explicitly:

```bash
TECTONIC=/absolute/path/to/tectonic bash /absolute/path/to/cv/build.sh
```

Tectonic may need network access on its first run to populate its TeX bundle
cache. The script does not install tools. It reports missing compilers and stops
on compilation errors. Compiler logs are kept in `build/`; named deliverables
are updated only after both variants compile successfully:

- `output/pdf/Saad_Kabir_Uddin_PhD_CV_Computer_Vision.pdf`
- `output/pdf/Saad_Kabir_Uddin_PhD_CV_Software_Engineering.pdf`

To compile just one variant manually, first change into `cv/` (or the extracted
archive folder) and create `build/`, then use either example below. Substitute
the Software Engineering entry point as needed. XeLaTeX is recommended to match
the Tectonic engine used for the supplied PDFs; pdfLaTeX is also supported, but
may produce different line and page breaks.

```bash
mkdir -p build
xelatex -no-shell-escape -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=build cv-computer-vision.tex
xelatex -no-shell-escape -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=build cv-computer-vision.tex
```

```bash
tectonic --keep-logs --outdir build cv-computer-vision.tex
```

For pdfLaTeX, replace `xelatex` with `pdflatex` in both commands of the first
example. The script disables shell escape explicitly for both TeX distribution
engines, including when invoked through `latexmk`.

## Overleaf

1. Create a blank Overleaf project and upload the contents of `cv/`, keeping
   `shared/` and `variants/` as folders. Generated `build/` and `output/` files are
   not needed. Alternatively, upload the source archive as a new project; its
   entry points and folders are already at the archive root.
2. Select **XeLaTeX** as the compiler and set the main document to
   `cv-computer-vision.tex`.
3. Recompile and download the PDF as
   `Saad_Kabir_Uddin_PhD_CV_Computer_Vision.pdf`.
4. Change the main document to `cv-software-engineering.tex`, recompile, and
   download it as `Saad_Kabir_Uddin_PhD_CV_Software_Engineering.pdf`.

Keep both entry points in the same project so edits to shared records apply to
both. The build script is for local use; Overleaf compiles the selected main
document directly. XeLaTeX uses the same font path as the supplied Tectonic
PDFs. pdfLaTeX is also supported, but review its potentially different line
and page breaks before using those PDFs.

## Layout and review after edits

`commands.tex` defines reusable section, dated-entry, education, research,
experience, project, publication, and reference commands. Change typography and
spacing there instead of formatting individual entries. Dates use consistent
right alignment without tables or manual strings of spaces.

The layout targets approximately two pages. There is an intentional `\newpage`
after the current bank role in `shared/professional-experience.tex`, keeping the
internships and later sections on the next page. Review this page break when
content expands; adjust wording or the break before reducing the body font.

After meaningful edits, compile and visually inspect **both** PDFs. Check page
count, margins, publication wrapping, headings, dates, bullets, references, and
the page break after the bank role. Review compiler logs for overfull boxes and
other relevant warnings. Also check selectable text, reading order, embedded
fonts, and clickable link targets. A successful compile alone does not establish
that the final layout is polished.

## Visible links

Links use dark blue text and underlining, so they remain recognizable in black
and white. Publications end with an explicit `Publication link`; each project
has a `Project link` below its title. Contact and profile links use the same
styling. Edit `\VisibleLink` and the `cvlink` color in `commands.tex` to change
this presentation for both variants at once. The proceedings publication is
listed before the book chapter in `shared/publications.tex`.
