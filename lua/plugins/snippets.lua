return {
  -- LuaSnip for snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
      
      -- Laravel snippets
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      
      ls.add_snippets("php", {
        -- Laravel Route
        s("route", {
          t("Route::"),
          i(1, "get"),
          t("('"),
          i(2, "/"),
          t("', ["),
          i(3, "Controller::class"),
          t(", '"),
          i(4, "method"),
          t("']);"),
        }),
        
        -- Laravel Controller
        s("controller", {
          t({"<?php", "", "namespace App\\Http\\Controllers;", "", "use Illuminate\\Http\\Request;", "", "class "}),
          i(1, "Controller"),
          t({" extends Controller", "{", "    public function "}),
          i(2, "index"),
          t({"()", "    {", "        "}),
          i(3, "// TODO: Implement"),
          t({"", "    }", "}"}),
        }),
        
        -- Laravel Model
        s("model", {
          t({"<?php", "", "namespace App\\Models;", "", "use Illuminate\\Database\\Eloquent\\Model;", "", "class "}),
          i(1, "Model"),
          t({" extends Model", "{", "    protected $fillable = ["}),
          i(2, "'name'"),
          t({"", "    ];", "}"}),
        }),
        
        -- Laravel Migration
        s("migration", {
          t({"<?php", "", "use Illuminate\\Database\\Migrations\\Migration;", "use Illuminate\\Database\\Schema\\Blueprint;", "use Illuminate\\Support\\Facades\\Schema;", "", "return new class extends Migration", "{", "    public function up()", "    {", "        Schema::create('"}),
          i(1, "table_name"),
          t({"', function (Blueprint $table) {", "            $table->id();", "            "}),
          i(2, "$table->string('name');"),
          t({"", "            $table->timestamps();", "        });", "    }", "", "    public function down()", "    {", "        Schema::dropIfExists('"}),
          f(function(args) return args[1][1] end, {1}),
          t({"');", "    }", "};"}),
        }),
        
        -- Laravel Blade directive
        s("blade", {
          t("@"),
          i(1, "if"),
          t("("),
          i(2, "condition"),
          t({")", "    "}),
          i(3, "content"),
          t({"", "@end"}),
          f(function(args) return args[1][1] end, {1}),
        }),
      })
      
      -- Blade snippets
      ls.add_snippets("blade", {
        s("extends", {
          t("@extends('"),
          i(1, "layouts.app"),
          t("')"),
        }),
        
        s("section", {
          t("@section('"),
          i(1, "content"),
          t({"')", "    "}),
          i(2, "content"),
          t({"", "@endsection"}),
        }),
        
        s("include", {
          t("@include('"),
          i(1, "partial"),
          t("')"),
        }),
        
        s("foreach", {
          t("@foreach("),
          i(1, "$items as $item"),
          t({")", "    "}),
          i(2, "{{ $item }}"),
          t({"", "@endforeach"}),
        }),
      })
    end,
  },
}
