//
//  Supabase.swift
//  TodoList
//
//  Created by Lexi on 2024-05-23.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://pugodczupbppwsjhftbx.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB1Z29kY3p1cGJwcHdzamhmdGJ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY0NzAyNTEsImV4cCI6MjAzMjA0NjI1MX0.7M3rddwgk2zvMs2gS46RABcBeqQvNINZHHoXRiq76ZI"
)
