//****************************************************************
// Function to calculate similarities based on the custom prompt
Function calculate($prompt : Text; $apiKey : Text) : cs:C1710.ChunkSelection  //Collection
	
	//If no key is found, alert the user
	If ($apiKey="")
		ALERT:C41("Please provide your OpenAI API key.")
		return ds:C1482.Chunk.newSelection()
	End if 
	
	//If trace mode is on, start 4D's TRACE debugger
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// Proceed only if both prompt and API key are available
	If ($prompt#"")
		
		// Generate a vector from the custom prompt using the AIManagement class
		var $vector:=cs:C1710.AIManagement.new($apiKey).generateVector($prompt)
		
		// Sort entity by cosine similarity
		return ds:C1482.Chunk.all().orderByFormula(Formula:C1597(This:C1470.embedding.cosineSimilarity($vector)); dk descending:K85:32).slice(0; 5)
		
		
	Else 
		// If no prompt, returns empty selection
		return ds:C1482.Chunk.newSelection()
		
	End if 
	
	//****************************************************************
	// Calculates similarity based on a selected prompt object
Function calculateWithSelectedPrompt($prompt : cs:C1710.PromptsEntity) : cs:C1710.ChunkSelection
	
	//If trace mode is on, start 4D's TRACE debugger
	If (Form:C1466.trace)
		TRACE:C157
	End if 
	
	// Return the receipts ordered by cosine similarity (most similar first)
	return ds:C1482.Chunk.all().orderByFormula(Formula:C1597(This:C1470.embedding.cosineSimilarity($prompt.Vector)); dk descending:K85:32).slice(0; 5)
	
	//return ds.Chunk.query("embedding > :1 order by embedding"; {vector: $prompt.Vector; metric: "cosine"; threshold: 0.6})
	//return ds.Chunk.query("embedding > :1 order by embedding"; {vector: $prompt.Vector; metric: "cosine"}).slice(0; 5)
	
	