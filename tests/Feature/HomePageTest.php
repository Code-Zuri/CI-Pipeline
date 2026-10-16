<?php

namespace Test\Feature;

use Tests\TestCase;

class HomePageTest extends TestCase
{
    public function test_home_page_is_accesible(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
}
