# CIS v5.0.0 Structure

This directory contains the structure for CIS Microsoft Azure Foundations Security Benchmark v5.0.0.

## Directory Structure

```
cis_v500/
├── cis.pp                 # Main benchmark definition
├── section_2.pp           # Common Reference Recommendations
├── section_3.pp           # Storage Accounts
├── section_4.pp           # Database Services
├── section_6.pp           # Networking
├── section_7.pp           # Virtual Machines
├── section_8.pp           # Key Vault
├── section_9.pp           # Microsoft Defender for Cloud
├── section_10.pp          # Miscellaneous
└── docs/
    ├── cis_overview.md    # Main overview document
    ├── cis_v500_2.md      # Section 2 overview
    ├── cis_v500_3.md      # Section 3 overview
    ├── cis_v500_4.md      # Section 4 overview
    ├── cis_v500_6.md      # Section 6 overview
    ├── cis_v500_7.md      # Section 7 overview
    ├── cis_v500_8.md      # Section 8 overview
    ├── cis_v500_9.md      # Section 9 overview
    └── cis_v500_10.md     # Section 10 overview
```

## What's Created

✅ Main benchmark file (`cis.pp`)
✅ Section structure files (section_2.pp through section_10.pp)
✅ Documentation directory with overview files
✅ Section overview markdown files

## What's Next

To complete the CIS v5.0.0 implementation, you'll need to:

1. **Add Controls and Sub-benchmarks**: Each section file needs to be populated with:
   - Sub-benchmark definitions (e.g., `cis_v500_2_1`, `cis_v500_2_2`, etc.)
   - Control definitions with queries
   - Appropriate tags and metadata

2. **Create Control Documentation**: For each control, create a corresponding markdown file in the `docs/` directory with:
   - Control description
   - Rationale
   - Audit procedures
   - Remediation steps
   - References

3. **Link to Queries**: Each control should reference an existing query from the `all_controls/` directory or you'll need to create new queries.

4. **Update Section Content**: Review the actual CIS v5.0.0 benchmark document and update section titles and content to match the official specification.

## Example Structure

Here's how a complete section might look:

```hcl
benchmark "cis_v500_2_1" {
  title         = "2.1 Subsection Title"
  documentation = file("./cis_v500/docs/cis_v500_2_1.md")
  children = [
    control.cis_v500_2_1_1,
    control.cis_v500_2_1_2
  ]
  tags = merge(local.cis_v500_2_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v500_2_1_1" {
  title         = "2.1.1 Control Title"
  description   = "Control description"
  query         = query.some_query_name
  documentation = file("./cis_v500/docs/cis_v500_2_1_1.md")

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.1"
    cis_level   = "1"
    cis_type    = "automated"
  })
}
```

## Notes

- Section 1 and Section 5 are not included (following the pattern from CIS v4.0.0)
- All section files currently have placeholder content
- You'll need the official CIS v5.0.0 benchmark document to populate the actual controls

