Skills are downloaded with `safely-download-skill`, which audits every file for
hidden/dangerous content and aborts BEFORE writing anything if a single file
looks unsafe (smuggled Unicode, or any binary/image/non-UTF-8 file).

```
./safely-download-skill <subfolder> <github-url>
```

`<github-url>` is a GitHub tree URL pointing at either a single skill or an
index of skills. Skills are written to `skills/<subfolder>/<skill-name>/` (the
source's own category folders are ignored). `<subfolder>` is required so skills
stay organized under `skills/`. Every skill's source URL is recorded in the
global `skills/manifest.json` (a simple `skill-name: url` map).

```
# a single skill -> skills/matt/improve-codebase-architecture/
./safely-download-skill matt https://github.com/mattpocock/skills/tree/main/skills/engineering/improve-codebase-architecture

# an index -> skills/matt/<each-skill>/
./safely-download-skill matt https://github.com/mattpocock/skills/tree/main/skills/engineering
```
