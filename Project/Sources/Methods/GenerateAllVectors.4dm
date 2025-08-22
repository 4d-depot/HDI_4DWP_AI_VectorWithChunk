//%attributes = {}
var $apiKey:="___API_KEY___"

// Chunk
TRUNCATE TABLE:C1051([Chunk:4])
SET DATABASE PARAMETER:C642([Chunk:4]; Table sequence number:K37:31; 1)

var $doc : cs:C1710.DocumentEntity
var $documents:=ds:C1482.Document.all()
var $colRange : Collection
var $chunk : cs:C1710.ChunkEntity
var $paragraph : Object

For each ($doc; $documents)
	// Retrieve the collection of the paragraph
	$colRange:=WP Get elements:C1550($doc.WP; wk type paragraph:K81:191)
	// For each paragraph, create a chunk
	For each ($paragraph; $colRange)
		$chunk:=ds:C1482.Chunk.new()
		$chunk.ID_Document:=$doc.ID
		// Save the paragraph range
		$chunk.startOffset:=WP Paragraph range:C1346($paragraph).start
		$chunk.endOffset:=WP Paragraph range:C1346($paragraph).end
		// Generate vector embedding using AIManagement
		$chunk.embedding:=cs:C1710.AIManagement.new($apiKey).generateVector($chunk.textExtract)
		$chunk.textExtract:=WP Get text:C1575($paragraph)
		$chunk.save()
	End for each 
	
End for each 


// Prompts
var $prompt : cs:C1710.PromptsEntity
var $prompts:=ds:C1482.Prompts.all()

For each ($prompt; $prompts)
	$prompt.Vector:=cs:C1710.AIManagement.new($apiKey).generateVector($prompt.Description)
	$prompt.save()
End for each 
