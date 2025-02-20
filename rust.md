# Rust Lang

## Actix

### Simple example

```rust
use tera::{
	Tera,
	Context,
};

pub struct PreRendor {
	pub tera: Tera,
	pub head: String,
	pub menu: String,
	pub footer: String,
	pub index: String,
	pub base_ctx: Context,
	pub options_md_parser: Options,
}
use pulldown_cmark::Options;

impl PreRendor {
	//TODO: Add "render only main_value"
	pub fn new() -> Self {
		// ctx.insert("some_calue", &999);
		let tera = Tera::new("templates/**")
			.unwrap_or_else(|error| {panic!("Panic! Parsing error: {}", error);});
		let mut ctx = Context::new();
		let head = crate::head::get_head(
			&tera,
			"Ailysom!"
		)
			.unwrap_or_else(|error| {panic!("Panic! Parsing error: {}", error);});
		let menu = crate::menu::get_menu(&tera)
			.unwrap_or_else(|error| {panic!("Panic! Parsing error: {}", error);});
		let index = std::fs::read_to_string("templates/index.html")
			.unwrap_or_else(|error| {panic!("Panic! Parsing error: {}", error);});
		let footer = std::fs::read_to_string("templates/footer.html")
			.unwrap_or_else(|error| {panic!("Panic! Parsing error: {}", error);});
		ctx.insert("head_value", &head);
		ctx.insert("menu_value", &menu);
		ctx.insert("main_value", &index);
		ctx.insert("foot_value", &footer);
		let index: String = tera.render("main.html", &ctx)
			.unwrap_or_else(|error| {panic!("Panic! Parsing error: {}", error);});
		ctx.remove("main_value");
		let opts = Options::empty();
		PreRendor {
			tera: tera,
			head,
			menu,
			footer,
			index,
			base_ctx: ctx,
			options_md_parser: opts,
		}
	} 
}

pub async fn index(data: actix_web::web::Data<PreRendor>)
-> impl actix_web::Responder {
	actix_web::HttpResponse::Ok().body(data.index.clone())
} 
```

## Basics

### Install

```bash

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

### Variables

```rust
let a = 5; // Create new variable. By default vars - immutable.
a = 6; // Error

let mut b = 7; // Create new mutable var.
b = 8; // Ok

const THREE_HOURS_IN_SECONDS: u32 = 60 * 60 * 3; // Create new constant. Calculate in build time!
```