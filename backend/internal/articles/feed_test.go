package articles

import (
	"strings"
	"testing"
)

func TestBuildFeedExcludesFallbackHeroFromBuckets(t *testing.T) {
	items := []Preview{
		{ID: 1, Slug: "a", DisplayType: "list"},
		{ID: 2, Slug: "b", DisplayType: "featured"},
		{ID: 3, Slug: "c", DisplayType: "list"},
	}

	feed := buildFeed(items)
	if feed.Hero == nil || feed.Hero.ID != 1 {
		t.Fatalf("hero = %#v, want id=1", feed.Hero)
	}
	for _, item := range feed.Featured {
		if item.ID == 1 {
			t.Fatal("fallback hero leaked into featured")
		}
	}
	for _, item := range feed.List {
		if item.ID == 1 {
			t.Fatal("fallback hero leaked into list")
		}
	}
	if len(feed.Featured) != 1 || feed.Featured[0].ID != 2 {
		t.Fatalf("featured = %#v", feed.Featured)
	}
	if len(feed.List) != 1 || feed.List[0].ID != 3 {
		t.Fatalf("list = %#v", feed.List)
	}
}

func TestBuildFeedPrefersExplicitHero(t *testing.T) {
	items := []Preview{
		{ID: 1, Slug: "a", DisplayType: "list"},
		{ID: 2, Slug: "b", DisplayType: "hero"},
		{ID: 3, Slug: "c", DisplayType: "featured"},
	}

	feed := buildFeed(items)
	if feed.Hero == nil || feed.Hero.ID != 2 {
		t.Fatalf("hero = %#v, want id=2", feed.Hero)
	}
	if len(feed.List) != 1 || feed.List[0].ID != 1 {
		t.Fatalf("list = %#v", feed.List)
	}
}

func TestBuildFeedHasMore(t *testing.T) {
	items := make([]Preview, feedSlotCount+1)
	for i := range items {
		items[i] = Preview{ID: i + 1, DisplayType: "list"}
	}
	if feed := buildFeed(items); !feed.HasMore {
		t.Fatal("expected HasMore")
	}
	if feed := buildFeed(items[:feedSlotCount]); feed.HasMore {
		t.Fatal("expected no HasMore at exact slot count")
	}
}

func TestAssembleContentEscapesHeading(t *testing.T) {
	out := AssembleContentFromBlocks([]Block{{
		Type:    "heading",
		Payload: []byte(`{"level":2,"text":"<script>alert(1)</script>"}`),
	}})
	if strings.Contains(out, "<script>") {
		t.Fatalf("script not escaped: %s", out)
	}
	if !strings.Contains(out, "&lt;script&gt;") {
		t.Fatalf("expected escaped script: %s", out)
	}
}
