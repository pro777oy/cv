# Saad Kabir Uddin — PhD CVs

Two academic CV variants share one set of factual records. All use a custom
`article` layout with US letter paper, Latin Modern fonts, 10.5 pt body text,
single-column reading order, and clickable links. No shell escape is required.
XeLaTeX and Tectonic use `fontspec` with explicitly selected Latin Modern OTF
files and common ligatures disabled for text extraction. The pdfLaTeX path uses
T1 encoding, `lmodern`, and `glyphtounicode` mappings instead.

## Files and maintenance

```text
CV/
├── cv-software-engineering.tex     # General Software Engineering entry point
├── cv-computer-vision.tex          # Computer Vision entry point
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
│   ├── certifications.tex          # Certification records shared by both variants
├── variants/
│   ├── cv-research-interests.tex
│   ├── software-engineering-research-interests.tex
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
project, or skill category in its corresponding `shared/` file. These
records are used by both variants, so factual changes only need one edit.

The main files set `\ifcvfocus` and load `shared/document.tex`. Variant files
select or order shared project and skill macros; keep factual records in the
shared files. Research Interests is the exception: each variant has its own
short line in `variants/*-research-interests.tex`. These lines describe research
interests, not additional publications or prior research achievements.

Both variants follow this order, controlled by `shared/document.tex`:

1. Header / Contact Information
2. Research Interests
3. Publications
4. Research Experience
5. Education
6. Professional Experience
7. Selected Projects
8. Technical Skills
9. Certifications


The primary Software Engineering CV prioritizes Software Engineering, AI for
Software Engineering (AI4SE), Software Engineering for AI (SE4AI), Software
Architecture, Software Security and AI for Security, and Reliable AI-Enabled
Software Systems. These are intended PhD
research directions, not claims of completed AI4SE or security research. It leads
its project list with RecWiz and retains all ML projects and skills.

The Computer Vision / ML CV focuses on Computer Vision, Deep Learning, Image
Segmentation, Biometric Recognition, Robust Visual Systems, and Applied Machine
Learning. It leads with the two ML projects and Machine Learning skills.

Both retain the same publications, iris-recognition research, brain-tumor paper
under review, education, professional experience, and certifications. The former
standalone AI4SE and SE4AI variants are retired; their prior versions remain in
Git history. Only the two entry points and two named PDFs below are maintained.

## Build locally

Use a TeX distribution providing `xelatex` or `pdflatex` and the packages listed
in `commands.tex`, or follow the [official Tectonic installation guide](https://tectonic-typesetting.github.io/book/latest/installation/).
`latexmk` is optional. From this workspace's repository root:

```bash
bash CV/build.sh
```

The source archive contains the contents of `CV/` directly at its root. After
extracting it, change into the extracted folder and run:

```bash
bash build.sh
```

The script also works from any directory when called with its absolute path.
An explicit `TECTONIC` environment variable takes precedence over all installed
compilers. Otherwise, the script tries `latexmk` with XeLaTeX, XeLaTeX twice,
`latexmk` with pdfLaTeX, pdfLaTeX twice, Tectonic on `PATH`, then a project-local
`.tools/tectonic`. The local fallback sets `XDG_CACHE_HOME` to `.tools/cache` to reuse
the bundled cache for offline rebuilding.

The source ZIP excludes `.tools/`; users of the extracted ZIP need an installed
TeX distribution or Tectonic, or can upload the project to Overleaf. To select a
portable Tectonic binary explicitly:

```bash
TECTONIC=/absolute/path/to/tectonic bash /absolute/path/to/CV/build.sh
```

Tectonic may need network access on its first run to populate its TeX bundle
cache. The script does not install tools. It reports missing compilers and stops
on compilation errors. Compiler logs are kept in `build/`; named deliverables
are updated only after both variants compile successfully:

- `output/pdf/Saad_Kabir_Uddin_PhD_CV_Software_Engineering.pdf`
- `output/pdf/Saad_Kabir_Uddin_PhD_CV_Computer_Vision.pdf`

To compile just one variant manually, first change into `CV/` (or the extracted
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

1. Create a blank Overleaf project and upload the contents of `CV/`, keeping
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
experience, project, and publication commands. Change typography and
spacing there instead of formatting individual entries. Dates use consistent
right alignment without tables or manual strings of spaces.

The layout targets two pages with the existing typography. Review automatic page breaks when
content expands; adjust wording before reducing the body font.

After meaningful edits, compile and visually inspect **both** PDFs. Check page
count, margins, publication wrapping, headings, dates, and bullets, and
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
