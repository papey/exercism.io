import re

BOLD = re.compile(r"__(.*?)__")
ITALIC = re.compile(r"_(.*?)_")
TITLE = re.compile(r"^(#{1,6}) (.*)")
OPENING_LIST = "<ul>"
CLOSING_LIST = "</ul>"


def parse(markdown):
    markdown = re.sub(BOLD, r"<strong>\1</strong>", markdown)
    markdown = re.sub(ITALIC, r"<em>\1</em>", markdown)

    result = []
    for line in markdown.split("\n"):
        is_title, title = parse_heading(line)
        if is_title:
            result.append(title)
        elif line.startswith("* "):
            result.append("<li>{item}</li>".format(item=line[2:]))
        else:
            result.append("<p>{line}</p>".format(line=line))

    return re.sub(r"(<li>.*</li>)", r"<ul>\1</ul>", "".join(result))


def parse_heading(line):
    title = re.match(TITLE, line)
    if title:
        return True, "<h{level}>{content}</h{level}>".format(
            level=len(title.group(1)), content=title.group(2)
        )

    return False, ""
