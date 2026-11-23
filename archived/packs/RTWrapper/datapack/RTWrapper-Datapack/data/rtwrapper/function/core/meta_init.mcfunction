# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
execute unless data storage rtwrapper:meta loaded run data merge storage rtwrapper:meta {version:"v1.0.0",id:"RTWrapper",type:"datapack",datapack_type:"library",status:"enabled"}
