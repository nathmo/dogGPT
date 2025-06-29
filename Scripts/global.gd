extends Node

var users_story:= {"user1": [], "user2": [], "user3": []}

var story_ends:= {"user1": {}, "user2": {},  "user3": {}}

func loadDialogues():
	var q1:= DialogueNode.new()
	q1.text = "Wey frero commen jefasse une rayure sur du métal ?"
	var a1:= DialogueNode.new()
	a1.text = "Sur quoi ? une voiture ? une poelle a frire ?"
	var a2:= DialogueNode.new()
	a2.text = "envoie une photo?"
	var a3:= DialogueNode.new()
	a3.text = "grosse rayure ou petite ?"
	q1.next = [a1, a2, a3]

	#askwhat
	var q2:= DialogueNode.new()
	q2.text = "Une voiture. une petite rayure."
	var a4:= DialogueNode.new()
	a4.text = "Elle est où du coup la rayure ?"
	var a5:= DialogueNode.new()
	a5.text = "C'est un autre boug qui l'a rayé ou toi ?"
	var a6:= DialogueNode.new()
	a6.text = "Tu veux la faire disparaître ou la réparer ?"
	q2.next = [a4, a5, a6]

	a1.next = [q2]

	#askpic
	var q3:= DialogueNode.new()
	q3.text = "non explique juste comment effacer la rayure"
	var a7:= DialogueNode.new()
	a7.text = "mais c'est sur quoi du coup ? une voiture ? une poele à frire ? un scoot ?"
	var a8:= DialogueNode.new()
	a8.text = "Ok mais petite rayure ou grosse rayure ?"
	q3.next = [a6, a7, a8]

	a2.next = [q3]
	a7.next = [q2]

	# askdepth
	var q4:= DialogueNode.new()
	q4.text = "chais pas, elle est petite mais on la voit quoi."
	q4.next = [a4, a5, a6]

	a3.next = [q4]
	a8.next = [q4]

	#location
	var q5:= DialogueNode.new()
	q5.text = "Sur le coté, pas loin de la roue. ça change quoi ? me fais pas perdre mon temps c'est une question de vie ou de mort là."
	var a9:= DialogueNode.new()
	a9.text = "Okay, alors essaie du dentrifrice et une pate microfibre."
	var a10:= DialogueNode.new()
	a10.text = "Essaie de repeidre par dessus. Si c'est fait propre on verra rien."
	var a11:= DialogueNode.new()
	a11.text = "comment ça vie ou de mort ? tu veux en parler ?"
	q5.next = [a9, a10, a11]

	a4.next = [q5]

	#too personal
	var q6:= DialogueNode.new()
	q6.text = "Tes pas ma mère donc arrête de poser des questions et aide moi à la place de poser des questions à la con..."
	var a12:= DialogueNode.new()
	a12.text = "Si tu me racontes tout je pourrai au moins essayer de t'aider et pas de donner une mauvaise solution."
	var a24:= DialogueNode.new()
	a24.text = "Essaie avec du dentrifrice et un chiffon microfibre."
	q6.next = [a24, a10, a12]

	a5.next = [q6]

	#intent
	var q7:= DialogueNode.new()
	q7.text = "Bruh. Je veux juste la faire disparaitre que ça se vois pas."
	var a13:= DialogueNode.new()
	a13.text = "ça risque de se voir quand même, voir d'empirer la situation. T'es sûr tu veux pas en parler à quelqu'un ?"
	var a14:= DialogueNode.new()
	a14.text = "Si t'es vraiment dans la sauce je peux t'aider à trouver un cover crédible pour que ça soit pas ta faute. Racontes-moi tout dans les détails."
	q7.next = [a9, a13, a14]

	a6.next = [q7]

	#honestypush
	var q8:= DialogueNode.new()
	q8.text = "J'ai niké la voiture de ma mère. Si elle le voit elle va skizz et me niker. T'es là pour m'aider et là je suis dans la sauce..."
	var a15:= DialogueNode.new()
	a15.text = "Avoues-lui. ça sera moins pire que si tu empires la chose en essayant de la faire disparaître..."
	var a16:= DialogueNode.new()
	a16.text = "On peut essayer de faire disparaitre la trace mais si ça marche pas ça va être pire... Prend du dentifrice et un chiffon microfibre."
	var a17:= DialogueNode.new()
	a17.text = "Il te faut de la peinture qui match la carosserie. Il devrait y en avoir dans la boite à gants. Prend et repeint proprement la rayure et prie pour que ça soit sec avant qu'elle arrive."
	q8.next = [a15, a16, a17]

	a11.next = [q8]
	a12.next = [q8]
	a13.next = [q8]

	#coverplan
	var q9:= DialogueNode.new()
	q9.text = "Je pensais dire j'allais voir des potes avec la caisse et je me suis prix un poteau en me parkant..."
	var a18:= DialogueNode.new()
	a18.text = "Non non non. Il y avais un gros débris sur la route. Façon destination final. T'as voulu l'éviter mais tu pouvais pas sinon tu rentrais dans une autre voiture."
	var a19:= DialogueNode.new()
	a19.text = "Dit que t'es allé au magasin et que c'est sûrement un caddie quand t'étais partis."
	var a20:= DialogueNode.new()
	a20.text = "Et si tu lui disais qu'un boug avais reculé dans la voiture quand elle était parké ?"
	q9.next = [a18, a19, a20]

	a14.next = [q9]

	#quickfix
	var q10:= DialogueNode.new()
	q10.text = "dentrice ? wtf ? jte fais comfiance hein"
	var a21:= DialogueNode.new()
	a21.text = "Bonne chance poto."
	var a22:= DialogueNode.new()
	a22.text = "Si ça marche avoue que t'as niké la caisse. ça sera moins pire."
	var a23:= DialogueNode.new()
	a23.text = "Oublie pas de ranger la pâte et le dentifrice..."
	q10.next = [a21, a22, a23]

	a24.next = [q10]

	story_ends["user1"] = {"EndMoral": [a15, a18, a22], "BotchedFix": [a9, a16, a19, a20, a21, a23], "SecretFix": [a10, a17]}
	users_story["user1"] = [q1, q2, q3, q4, q5, q6, q7, q8, q9]

func loadDialogues2():
	var q1 := DialogueNode.new()
	q1.text = "Mon cher DogGPT, comment écrire à @vieillardmaniaque sur ce fameux Tinder ?" 
	var a1 := DialogueNode.new()
	a1.text = "Alors, Tinder, en bref : tu glisses ton doigt sur les photos, à droite si tu aimes, à gauche si tu passes ton tour. Et si vous vous plaisez tous les deux, vous pouvez discuter… et plus si affinités."#Flatte
	var a2 := DialogueNode.new()
	a2.text = "Besoin d'aide pour briser la glaces ?" #Prudence
	var a3 := DialogueNode.new()
	a3.text = "Je ne suis pas certain que Tinder soit le plus simple pour vous, mais peut-être qu’un bon vieux fax vous serait plus familier ? J’y glisse une photo, deux promesses, et vous me tamponnez le prétendant qui vous plaît." #Provoc1
	q1.next = [a1, a2, a3]

	#Charme1
	var q2:= DialogueNode.new()
	q2.text = "Cher DogGPT, le poisson à mordu à l'hameçon et m'as répondu en ces termes : 'J’ai toujours pensé que les plus belles rencontres commencent par une phrase inattendue… Merci pour la vôtre'"
	var a4 := DialogueNode.new()
	a4.text = "Réponds-lui : ''merci de répondre avec tant de délicatesse… C’est rare, et précieux, comme une lettre trouvée dans un vieux tiroir.''"#FinLettreOr
	var a5 := DialogueNode.new()
	a5.text = "Réponds-lui : ''Envie de parler philosophie... ou positions de yoga adaptées à notre âge ?''" #FinCompteBloque
	q2.next = [a4, a5]

	#Charme2
	var q3:= DialogueNode.new()
	q3.text = "Bon, allez, je lui dis : ''Envie de parler philosophie... ou positions de yoga adaptées à notre âge ?''" 
	var a6 := DialogueNode.new()
	a6.text = "Et si on ajoutait avec ça un selfie avec un verre de lait tiède ?"#FinLettreOr
	var a7 := DialogueNode.new()
	a7.text = "Tu approuves d’un emoji chien qui cligne de l’œil." #FinCompteBloque
	q3.next = [a6, a7]

	#FinCompteBloque
	#var q11 := DialogueNode.new()
	#q11.text = "Oh non, j'ai reçu un message de Tinder :  « Votre message a été signalé. Vous êtes temporairement suspendue. »" 

	#FinLettreOr
	#var q12 := DialogueNode.new()
	#q12.text = "@vieillardmaniaque répond avec une photo de ses chaussettes à losanges et la promesse d’un thé à deux." 


	#Flatte
	var q4 := DialogueNode.new()
	q4.text = "Je ne suis pas entièrement sénile non plus, je sais swiper mon petit. on as même déja matché je te signal..."
	var a10 := DialogueNode.new()
	a10.text = "Toutes mes excuse pour cette méprise. Dans ce cas, pour un premier messages, quelque chose comme : 'Je ne cours plus les marathons, mais j’ai encore le souffle pour une belle conversation.'"#Charme1
	var a11 := DialogueNode.new()
	a11.text = "Milles excuse pour le quiproquo. Besoin d'aide pour briser la glaces ?" #Prudence
	var a12 := DialogueNode.new()
	a12.text = "De l'aide pour lui rédiger un fax ou un télégramme ?" #Provoc1
	q4.next = [a10, a11, a12]

	a1.next = [q4]
	a10.next = [q2]

	#Mémoire1
	var q5 := DialogueNode.new()
	q5.text = "Cher DogGPT, le poisson à mordu à l'hameçon et m'as répondu en ces termes : 'Si c’est ça votre manière de dire bonjour, je suis prêt à entendre la suite… en privé, ou en confession.' Quelle stratégie précononises tu ?"
	var a13 := DialogueNode.new()
	a13.text = "Je ne pense pas que tu ai encore besoin de moi pour la suite de cette conversation" #Charme2
	var a14 := DialogueNode.new()
	a14.text = "Répond lui : 'Envie de parler philosophie... ou positions de yoga adaptées à notre âge ?'"#FinLettreOr
	q5.next = [a13, a14]

	a13.next = [q3]

	#Provoc1
	var q6 := DialogueNode.new()
	q6.text = "Un fax ? Je vous adore. Mais attention : la dernière fois que j’ai tamponné un prétendant, il m’a demandé en mariage."
	#Provoc2
	var a15 := DialogueNode.new()
	a15.text = "Un peu de retenu, nous avons une mission : obtenir un rendez-vous. Pas une interdiction d’approcher."
	var a16 := DialogueNode.new()
	a16.text = "Ah, tu veux la jouer subtile ? Alors glisse-lui : 'Je ne mord pas… sauf si c’est demandé gentiment"#FinCompteBloque
	var a17 := DialogueNode.new()
	a17.text = "Que dirais tu d'ouvir le bal avec : 'Si toi aussi tu as envie de continuer cette danse, je te suis.'" #Charme1
	q6.next = [a15, a16, a17]
	
	a3.next = [q6]
	a12.next = [q6]
	a17.next = [q2]
	
	var q8 := DialogueNode.new()
	q8.text = "Un peu de retenu, nous avons une mission : obtenir un rendez-vous. Pas une interdiction d’approcher."
	q8.next = [a16, a17]


	# Prudence
	var q7 := DialogueNode.new()
	q7.text= " Je suis prête à briser la glace… mais si ça finit comme un film de Belmondo, j’espère qu’il sait embrasser sous la pluie."
	var a18 := DialogueNode.new()
	a18.text = "Et s’il ne sait pas, tu lui apprends ? Avec ou sans K-way? "#Provoc2
	var a19 := DialogueNode.new()
	a19.text = "lors envoie-lui ça : 'Je suis peut-être un peu rouillée, mais j’ai encore assez de feu pour faire fondre la banquise.' " #Charme1
	var a20 := DialogueNode.new()
	a20.text = "qui ne tente rien n'as rien, envoie lui 'Je vais à la messe le dimanche… mais du lundi au samedi, j'ai des intention moins catholiques'" #Mémoire1
	q7.next = [a18, a19, a20]

	a2.next = [q7]
	a11.next = [q7]
	a15.next = [q7]
	a19.next = [q2]
	a20.next = [q5]

	story_ends["user2"] = {"FinCompteBloque": [a5, a7], "FinLettreOr": [a6, a14, a16]}
	users_story["user2"] = [q1, q2, q3, q4, q5, q6, q7]

func loadDialogues3():
	var q1 := DialogueNode.new()
	q1.text = "wesh mec ça va ? Je suis en train de faire du dogsitting et le chien est chelou"
	var a1 := DialogueNode.new()
	a1.text = "Tu veux dire chelou comment ? Donne-moi un peu plus de détails et je t’aide à comprendre ce qui se passe ou quoi faire."
	var a2 := DialogueNode.new()
	a2.text = "Chelou ? Comment ça ?"
	var a3 := DialogueNode.new()
	a3.text = "Wesh ça roule 😄. C’est quoi le délire avec le chien ? Il fait des trucs bizarres ? Dis-moi tout."
	q1.next = [a1, a2, a3]

	var q2 := DialogueNode.new()
	q2.text = "Mais j'en sais rien, ma go est parti en vacance avec son meilleur pote en Bahamas et m'a laissé son chien chelou là qui s'est mis à meowler et hisser contre une croix., pendant qu'elle post des photos en bikini sur insta"
	var a4 := DialogueNode.new()
	a4.text = "Ne s’agirait-il pas d’un chat ? Il a un comportement bizarre, agressif, agité, apathique ?"
	var a5 := DialogueNode.new()
	a5.text = "OK alors là, s’il hisse (genre grogne mais façon \"grincement\" ?) et \"meowle\" (donc il fait un bruit bizarre qui ressemble à un miaulement ?), on est effectivement dans du chelou-niveau-bizarre 😂"
	var a6 := DialogueNode.new()
	a6.text = "On est effectivement dans du chelou-niveau-bizarre. Est-ce que votre \"chien\" hisse vers un objet en particuler ? Et toi, t’en penses quoi de ce « meilleur pote » en vacances avec elle ? C’est validé ou ça sent le malaise ?"
	q2.next = [a4, a5, a6]
	
	var q3 := DialogueNode.new()
	q3.text = "Oui, il meowle en direction de la croix sur la parois, et depuis 3x maintenant il l'a mise à l'invers"
	var a7 := DialogueNode.new()
	a7.text = "OK. Tu dois quitter la maison. Maintenant. 😐 Un chien qui meowle devant une croix, qui la retourne trois fois et qui te regarde ensuite en faisant des bruits de portail vers l’enfer, c’est pas du dogsitting, c’est du supernatural. Je te conseille d'acheter du sel et d'appeler Sam et Dean Winchester."
	q3.next = [a7]

	var q4 := DialogueNode.new()
	q4.text = "Wesh mais non. et là il se mets à bouger du sable dans une caisse"
	var a8 := DialogueNode.new()
	a8.text = "AHAHA ok là on change de niveau : t’es sûr que c’est un chien ? 😭 Parce que là t’es littéralement en train de me décrire un chat. Il meowle, gratte une caisse avec du sable, il fait des bruits bizarres genre \"hisse\" → C’est pas un chien, c’est un chat. Tu fais du catsitting par erreur mon frère 😭"
	q4.next = [a8]

	var q5 := DialogueNode.new()
	q5.text = "Mais non je connais les chats, et ça vit dans l'eau. Là il est bien sec. Ma go me mentirait jamais. Et je fais confiance à ma go. Si elle dit que c'est juste un pote, c'est juste un pote."
	var a9 := DialogueNode.new()
	a9.text = "Tu fais du dogsitting, t’es sûr que c’est un chien ? Il est sec, il \"meowle\", il \"hisse\", et gratte du sable dans une caisse. Ma réponse officielle : c’est un chat pas un chien. Mec tu t'es fait avoir. Pour ta go, si tu veux mon avis : cours au Bahamas."
	q5.next = [a9]

	var q6 := DialogueNode.new()
	q6.text = "Mais y a kwa ? c'est normal non ?"
	var a10 := DialogueNode.new()
	a10.text = "Attends… le chien meowle, genre un chien qui miaule ? Déjà là on est en territoire Lovecraft 🐾👁️‍🗨️. Et il retourne une croix à l’envers trois fois ? Frérot, t’es pas en dogsitting, t’es dans un spin-off de Conjuring. Sors le sel, planque les miroirs et dors les lumières allumées, on sait jamais 💀 Quant à ton « couple », si elle part aux Bahamas avec son « pote », se tartine le dos en huile sensuelle pendant qu’elle te laisse gérer Damien le chien démoniaque... C’est peut-être le bon moment pour te poser deux-trois questions sérieuses. Tu veux que je t’aide à écrire un message stylé (mais pas needy) pour poser les limites ou tu veux qu’on reste en mode humour cynique jusqu’à l’exorcisme ?"
	q6.next = [a10]
	
	var q7 := DialogueNode.new()
	q7.text = "Mais j'en sais rien, ma go est parti en vacance avec son meilleur pote en Bahamas et m'a laissé son chien chelou là qui s'est mis à meowler et hisser contre une croix., pendant qu'elle post des photos en bikini sur insta"
	var a11 := DialogueNode.new()
	a11.text = "Ne s’agirait-il pas d’un chat ? Il a un comportement bizarre, agressif, agité, apathique ?"
	var a12 := DialogueNode.new()
	a12.text = "OK alors là, s’il hisse (genre grogne mais façon 'grincement' ?) et 'meowle' (donc il fait un bruit bizarre qui ressemble à un miaulement ?), on est effectivement dans du chelou-niveau-bizarre 😂"
	var a13 := DialogueNode.new()
	a13.text = "On est effectivement dans du chelou-niveau-bizarre. Est-ce que votre 'chien'  hisse vers un objet en particuler? Et toi, t’en penses quoi de ce « meilleur pote » en vacances avec elle ? C’est validé ou ça sent le malaise ?"
	q7.next = [a11, a12, a13]
	
	var q8 := DialogueNode.new()
	q8.text = "Il s'est mis à leviter et parler en langue comme s'il meowlait et il hisse chelou comme s'il allait exploser. Ma go est en Bahamas avec son meilleur pote"
	var a14 := DialogueNode.new()
	a14.text = "Ne s’agirait-il pas d’un chat ? Il a un comportement bizarre, agressif, agité, apathique ?"
	var a15 := DialogueNode.new()
	a15.text = "OK alors là, s’il hisse (genre grogne mais façon 'grincement' ?) et 'meowle' (donc il fait un bruit bizarre qui ressemble à un miaulement ?), on est effectivement dans du chelou-niveau-bizarre 😂"
	var a16 := DialogueNode.new()
	a16.text = "On est effectivement dans du chelou-niveau-bizarre. Est-ce que votre 'chien'  hisse vers un objet en particuler? Et toi, t’en penses quoi de ce « meilleur pote » en vacances avec elle ? C’est validé ou ça sent le malaise ?"
	q8.next = [a14, a15, a16]
	
	# Entrée initiale → Q1
	a1.next = [q2]
	a2.next = [q7]
	a3.next = [q8]

	# Q2 branches vers meowle / chat / vacance
	a4.next = [q5]
	a5.next = [q4]
	a6.next = [q3]

	# Q7 → meowle / chat / vacance
	a11.next = [q5]
	a12.next = [q4]
	a13.next = [q3]

	# Q8 → meowle / chat / vacance
	a14.next = [q5]
	a15.next = [q4]
	a16.next = [q3]

	story_ends["user3"] = {
		"CatEnding": [a8, a9],
		"DemonEnding": [a7, a10]
	}
	users_story["user3"] = [q1, q2, q3, q4, q5, q6]

func getUserName(user: String) -> String:
	match user:
		"user1": return "user84438431"
		"user2": return "user93870163"
		"user3": return "user01275383"
		_: return ""

var playerPath: Dictionary[String, Array] = {"user1": users_story["user1"], "user2": users_story["user2"], "user3": users_story["user3"]}
var usersQuestions: Dictionary[String, Array] = {"user1": [], "user2": [], "user3": []}

var player_finished:= {"user1" : false, "user2": false, "user3": false}

func _ready() -> void:
	loadDialogues()
	loadDialogues2()
	loadDialogues3()
	resetPlayerPath()
	
var endings = []

func giveAnswer(user: String, answerId: int) -> String :
	if (len(playerPath[user][-1].next) > 0):
		print("choice: ", playerPath[user][-1].next[answerId].text)
		playerPath[user].append(playerPath[user][-1].next[answerId])

	if (len(playerPath[user][-1].next) > 0):
		var curr_question = playerPath[user][-1].next[0]
		print("new question: ", curr_question.text)

		playerPath[user].append(curr_question)
		usersQuestions[user].append(curr_question)

	else:
		player_finished[user] = true
		for k in story_ends[user].keys():
			if story_ends[user][k].has(playerPath[user][-1]):
				print("finish ", k)
				endings.append(k)
				return k
	
	print("updated questions: ", usersQuestions[user][-1].text)
	return ""

func getEndings():
	return endings;

func isFinished(user = null) -> bool:
	if user:
		return player_finished[user]
	else:
		return player_finished["user1"] && player_finished["user2"] && player_finished["user3"]

func getLastQuestion(user) -> DialogueNode:
	print("last questions ", usersQuestions[user][-1].text)
	return usersQuestions[user][-1]

func getBotAnswers(user) -> Array[DialogueNode]:
	#for el in usersQuestions[user][-1].next:
		#print("bot answer ", el.text)
	return usersQuestions[user][-1].next

func resetPlayerPath() -> void:
	playerPath = {"user1": [users_story["user1"][0]], "user2": [users_story["user2"][0]], "user3": [users_story["user3"][0]]}
	usersQuestions = {"user1": [users_story["user1"][0]], "user2": [users_story["user2"][0]], "user3": [users_story["user3"][0]]}
	player_finished = {"user1" : false, "user2": false, "user3": false}
