(
local rf
 
rollout zero_rollout "" height:15 category:0
(
	button toggle "Open" align:#center width:180 height:32 offset:[4,-6]
	on toggle pressed do 
	(
		for r in rf.rollouts where r != zero_rollout do r.open = not r.open
		if toggle.text == "Close" then toggle.text = "Open" else toggle.text = "Close"
	)
)	
rollout first_rollout "1st Rollout" width:150 category:2
(
	on first_rollout rolledUp state do 
	(
	if state then rf.size += [0,first_rollout.height] else rf.size -= [0,first_rollout.height]
	)

	label rights "First"
 
)
rollout second_rollout "2nd Rollout" category:1
(
	
	on second_rollout rolledUp state do 
	(
	if state then rf.size += [0,second_rollout.height] else rf.size -= [0,second_rollout.height]
	)

	label second "Second"
)
rf = newRolloutFloater "Rollout Order Test" 200 140
addRollout zero_rollout rf rolledUp:false border:false
addRollout first_rollout rf rolledUp:true
addRollout second_rollout rf rolledUp:true
)
