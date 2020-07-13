$(function() {
	

	// ////////////////////////////////////////////////////////////////////////////////
	// 툴팁 집어넣기 초기형
	$("#btn").click(function() {
		var input = $("#keyword");
		$("#list").addClass("show");
		$("#modalbody2").removeClass("show");
		// b_content.append("<span class='calorie' data-no='"+c_no+"'
		// data-toggle='tooltip' title='"+c_name+"'>"+input.val()+"</span>");
		insert(input.val());
	});
	function tooptipAppend(value) {
		if (savedSelection) {
			restoreSelection(document.getElementById("b_content"),
					savedSelection);
		}
		var el = document.getElementById("b_content");
		pasteHtmlAtCaret(value, el);
	}
	function insert(keyword) {
		$
				.ajax({
					data : {
						keyword : keyword
					},
					url : "/service/calorieSearch",
					type : "post",
					success : function(data) {
						console.log(data);

						var str = '';
						$
								.each(
										data,
										function(i) {
											str += '<TR>';
											str += '<TD>' + data[i].c_name
													+ '</TD><TD>'
													+ data[i].c_serve
													+ '</TD><TD>'
													+ data[i].c_amount
													+ '</TD>';
											str += "<td><button type='button' class='btn btn-default insert' data-no='"
													+ data[i].c_no
													+ "' data-name='"
													+ data[i].c_name
													+ "' data-serve='"
													+ data[i].c_serve
													+ "' data-amount='"
													+ data[i].c_amount
													+ "' data-keyword='"
													+ keyword + "'>선택</button>";
											// $(".insert").data("name",
											// data[i].c_name);
											// $(".insert").data("no",
											// data[i].c_no);
											// $(".insert").data("serve",
											// data[i].c_serve);
											// $(".insert").data("amount",
											// data[i].c_amount);
											// $(".insert").data("keyword",
											// keyword);

											str += '</TR>';
										});
						$("#listbody").empty().append(str);
						$('[data-toggle="tooltip"]').tooltip();
					}
				});
	}
	$("#listbody").on("click", ".insert", function(event) {
		event.preventDefault();
		var c_no = $(this).data('no');
		var c_name = $(this).data('name');
		var c_serve = $(this).data('serve');
		var c_amount = $(this).data('amount');
		var keyword = $(this).data('keyword');

		$("#caltemp").data("name", c_name);
		$("#caltemp").data("no", c_no);
		$("#caltemp").data("serve", c_serve);
		$("#caltemp").data("amount", c_amount);
		// $("#textarea").append("<span class='calorie' data-no='"+c_no+"'
		// data-toggle='tooltip' title='"+c_name+"("+c_serve+"g) :
		// "+c_amount+"kcal'>"+keyword+"</span>&nbsp;&nbsp;");

		$("#list").removeClass("show");
		$("#modalbody2").addClass("show");

		$("#calName").val(c_name);
		$("#calWord").val(keyword);

	});

	/**
	 * data-no: c_no 저장용 title:툴팁내용 -> 무엇(얼마g) : 얼마얼마 kcal
	 * 
	 * <span class='calorie' data-no='"+data[i].c_no+"' data-toggle='tooltip'
	 * title='"+data[i].c_name+"("+data[i].c_serve+"g) :
	 * "+data[i].c_amount+"kcal'>"+keyword+"</span>
	 */
	// ////////////////////////////////////////////////////////////////////////////////
	$("#calAdd").click(
			function() {
				var c_no = $("#caltemp").data('no');
				var c_name = $("#caltemp").data('name');
				var c_serve = $("#caltemp").data('serve');
				var c_amount = $("#caltemp").data('amount');
				var keyword = $("#caltemp").data('keyword');
				var word = $("#calWord").val();
				if (word != "" && word.length > 0) {
					tooptipAppend("<span class='calorie' data-no='" + c_no
							+ "' data-toggle='tooltip' title='" + c_name + "("
							+ c_serve + "g) : " + c_amount
							+ "kcal' contenteditable='false'>" + word
							+ "</span>;");
					$('[data-toggle="tooltip"]').tooltip();
					$("#myModal0").modal('toggle');
				} else
					$("#calWord").addClass("error");
			});
	$("#b_content").on("click", ".calorie", function(event) {
		event.preventDefault();
		$('[data-toggle="tooltip"]').tooltip('destroy');
		$('[data-toggle="tooltip"]').tooltip();
		$(this).remove();
		console.log($(this));
	});
});

// 커서에 툴팁넣기
// ////////////////////////////////////////////////////////////////////////////////////////////////////

// ///커서저장
var saveSelection, restoreSelection;

if (window.getSelection && document.createRange) {
	saveSelection = function(containerEl) {
		var range = window.getSelection().getRangeAt(0);
		var preSelectionRange = range.cloneRange();
		preSelectionRange.selectNodeContents(containerEl);
		preSelectionRange.setEnd(range.startContainer, range.startOffset);
		var start = preSelectionRange.toString().length;
		

		return {
			start : start,
			end : start + range.toString().length
		};
	};

	restoreSelection = function(containerEl, savedSel) {
		var charIndex = 0, range = document.createRange();
		range.setStart(containerEl, 0);
		range.collapse(true);
		var nodeStack = [ containerEl ], node, foundStart = false, stop = false;

		while (!stop && (node = nodeStack.pop())) {
			if (node.nodeType == 3) {
				var nextCharIndex = charIndex + node.length;
				if (!foundStart && savedSel.start >= charIndex
						&& savedSel.start <= nextCharIndex) {
					range.setStart(node, savedSel.start - charIndex);
					foundStart = true;
				}
				if (foundStart && savedSel.end >= charIndex
						&& savedSel.end <= nextCharIndex) {
					range.setEnd(node, savedSel.end - charIndex);
					stop = true;
				}
				charIndex = nextCharIndex;
			} else {
				var i = node.childNodes.length;
				while (i--) {
					nodeStack.push(node.childNodes[i]);
				}
			}
		}

		var sel = window.getSelection();
		sel.removeAllRanges();
		sel.addRange(range);
	}
} else if (document.selection) {
	saveSelection = function(containerEl) {
		var selectedTextRange = document.selection.createRange();
		var preSelectionTextRange = document.body.createTextRange();
		preSelectionTextRange.moveToElementText(containerEl);
		preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
		var start = preSelectionTextRange.text.length;

		return {
			start : start,
			end : start + selectedTextRange.text.length
		}
	};

	restoreSelection = function(containerEl, savedSel) {
		var textRange = document.body.createTextRange();
		textRange.moveToElementText(containerEl);
		textRange.collapse(true);
		textRange.moveEnd("character", savedSel.end);
		textRange.moveStart("character", savedSel.start);
		textRange.select();
	};
}

var savedSelection;
function doSave() {
	savedSelection = saveSelection(document.getElementById("b_content"));
	console.log(savedSelection);
}

// /////////////////////////////////커서에 툴팁 넣기
function setEndOfContenteditable(contentEditableElement) {
	var range, selection;
	if (document.createRange) // Firefox, Chrome, Opera, Safari, IE 9+
	{
		range = document.createRange(); // Create a range (a range is a like the
										// selection but invisible)
		range.selectNodeContents(contentEditableElement); // Select the entire
															// contents of the
															// element with the
															// range
		range.collapse(false); // collapse the range to the end point. false
								// means collapse to end rather than the start
		selection = window.getSelection(); // get the selection object (allows
											// you to change selection)
		selection.removeAllRanges(); // remove any selections already made
		selection.addRange(range); // make the range you have just created the
									// visible selection
	} else if (document.selection) // IE 8 and lower
	{
		range = document.body.createTextRange(); // Create a range (a range
													// is a like the selection
													// but invisible)
		range.moveToElementText(contentEditableElement); // Select the entire
															// contents of the
															// element with the
															// range
		range.collapse(false); // collapse the range to the end point. false
								// means collapse to end rather than the start
		range.select(); // Select the range (make it the visible selection
	}
}

function elementContainsSelection(el) {
	var sel;
	if (window.getSelection) {
		sel = window.getSelection();
		if (sel.rangeCount > 0) {
			for (var i = 0; i < sel.rangeCount; ++i) {
				if (!isOrContains(sel.getRangeAt(i).commonAncestorContainer, el)) {
					return false;
				}
			}
			return true;
		}
	} else if ((sel = document.selection) && sel.type != "Control") {
		return isOrContains(sel.createRange().parentElement(), el);
	}
	return false;
}

function isOrContains(node, container) {
	while (node) {
		if (node === container) {
			return true;
		}
		node = node.parentNode;
	}
	return false;
}

function pasteHtmlAtCaret(html, el) {
	var sel, range;
	if (window.getSelection) {
		// IE9 and non-IE
		sel = window.getSelection();
		if (elementContainsSelection(el)) {
			if (sel.getRangeAt && sel.rangeCount) {
				range = sel.getRangeAt(0);
				range.deleteContents();

				// Range.createContextualFragment() would be useful here but is
				// non-standard and not supported in all browsers (IE9, for one)
				var el = document.createElement("span");
				el.innerHTML = html;
				var frag = document.createDocumentFragment(), node, lastNode;
				while ((node = el.firstChild)) {
					lastNode = frag.appendChild(node);
				}
				range.insertNode(frag);

				// Preserve the selection
				if (lastNode) {
					range = range.cloneRange();
					range.setStartAfter(lastNode);
					range.collapse(true);
					sel.removeAllRanges();
					sel.addRange(range);
				}
			} else if (document.selection
					&& document.selection.type != "Control") {
				// IE < 9
				document.selection.createRange().pasteHTML(html);
			}
		} else {
			setEndOfContenteditable(el);
			pasteHtmlAtCaret(html, el);
		}
	}

}
// ////////////////////////////////////////////////////////////////////////////////////////////////////
