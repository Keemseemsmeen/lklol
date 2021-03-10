private["_handled"];
_handled = true;
switch (_this select 1) do {
	case GZL_KEY_VIEW_TOGGLE: {if (GZL_SCENE_ACTIVE) then {GZL_CAM_SWITCH = true;};}; 
	case GZL_KEY_SCENE_SKIP: {if (GZL_SCENE_ACTIVE) then {GZL_SCENE_SKIP = true;};}; 
	case GZL_KEY_DIALOG: { if (!GZL_CREATE_ACTIVE) then {[] spawn GZL_Dialog_Director;} else {
		[] spawn GZL_Dialog_Create;	};};
	case GZL_KEY_SCENE_HOLD: {if (GZL_SCENE_ACTIVE) then {GZL_SCENE_EXTEND = true;};};
	case GZL_KEY_SUBJECT_HOLD : {if (GZL_SCENE_ACTIVE) then {GZL_SUBJECT_HOLD = !GZL_SUBJECT_HOLD;};};
	default { _handled = false; }; };
_handled;