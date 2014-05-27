toc = ["Table of Contents","Chapter 1: Getting Started", "page 1", 
"Chapter 2: Numbers", "page 9", "Chapter 3: Letters", "page 13"]

page_width = 60
puts ('Table of Contents'.center(page_width))
puts ''
puts ('Chapter 1: Getting Started'.ljust(page_width/2) + 'page 1'.rjust(page_width/2))
puts ('Chapter 2: Numbers'.ljust(page_width/2) + 'page 9'.rjust(page_width/2))
puts ('Chapter 3: Letters'.ljust(page_width/2) + 'page 13'.rjust(page_width/2))