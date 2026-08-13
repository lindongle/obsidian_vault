---
title: 配置二维转PDF，三维转stp
updated: 2026-06-06T00:16
created: 2023-06-27T17:50:30
---

\<auxiliary_file cad_type="DRW" direction="cadtopdm"\>
\<pdm_location pdm_type="PDF" named_ref="PDF_Reference"/\>
\<file_name pattern="{cad_name,lower}\*.pdf"/\>
\<cadtopdm_control label="Save PDF Files" user_preference_default="true"/\>
\<pdf sheets="current"/\>
\</auxiliary_file\>
\<!--ASM:PRT转STP--\>
\<auxiliary_file cad_type="ASM:PRT" direction="cadtopdm"\>
\<pdm_location named_ref="Y6_ProE" relation_type="IMAN_Rendering" pdm_type="Y6_STP"/\>
\<file_name pattern="{cad_name,lower}.stp"/\>
\<cadtopdm_control label="STEP" user_preference_default="true"/\>
\<user_exit file_name="{cad_name,lower}.stp" ignore_status="true"/\>
\</auxiliary_file\>
