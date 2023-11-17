extends ContentController

const InteractableLog = preload("res://Scripts/InteractableLog.gd");
const Character = preload("res://models/Character.gd");

var _parent: Node;

func _init(parent: Node):
	_parent = parent;
	run();

func run():
	_renderPiece(Character.Descriptor.HAIR);
	_renderPiece(Character.Descriptor.FACE);
	_renderPiece(Character.Descriptor.NOSE);
	_renderPiece(Character.Descriptor.LIPS);
	_renderPiece(Character.Descriptor.ARMS);
	_renderPiece(Character.Descriptor.FINGERS);
	_renderPiece(Character.Descriptor.BREASTS);
	_renderPiece(Character.Descriptor.NIPPLES);
	_renderPiece(Character.Descriptor.STOMACH);
	_renderPiece(Character.Descriptor.BACK);
	_renderPiece(Character.Descriptor.GROIN);
	_renderPiece(Character.Descriptor.VAGINA);
	_renderPiece(Character.Descriptor.BUTT);
	_renderPiece(Character.Descriptor.THIGHS);
	_renderPiece(Character.Descriptor.LEGS);
	_renderPiece(Character.Descriptor.FEET);

func _renderPiece(descriptor: Character.Descriptor):
	var log = InteractableLog.new();
	log.text = Character.descriptorToText(descriptor);
	log.gui_input.connect(onGuiInput.bind(descriptor));
	_checkActiveIndicator(log, descriptor);
	_parent.add_child(log)

func _checkActiveIndicator(log: InteractableLog, descriptor: Character.Descriptor):
	if State.activeDescriptor == descriptor:
		log.text = ">>" + log.text + "<<";

func onGuiInput(event, descriptor: Character.Descriptor):
	if isGuiClickEvent(event):
		State.activeDescriptor = descriptor;
